from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import numpy as np
from sklearn.svm import SVR
from sklearn.model_selection import KFold, LeaveOneOut, RepeatedKFold, ShuffleSplit, StratifiedKFold
import kan
import os
os.environ['DDEBACKEND'] = 'tensorflow.compat.v1'
import deepxde as dde
from data import FileData
import tensorflow as tf
tf.config.run_functions_eagerly(False)
dde.backend.set_default_backend('tensorflow.compat.v1')
dde.backend.tf.Session()
import torch
import torch.nn as tnn
import torch.optim as optim
from torch.utils.data import DataLoader, TensorDataset

global apeG, yG

def svm(data):
    clf = SVR(kernel='rbf')
    clf.fit(data.train_x, data.train_y[:, 0])
    y_pred = clf.predict(data.test_x)[:, None]
    return dde.metrics.get('MAPE')(data.test_y, y_pred)

def t2s(names):
    if type(names) is str:
        return names
    else:
        return '[' + ','.join(names) + ']'
    
def nn(data, lay, wid):
    #lay, wid = 2, 32
    layer_size = [data.train_x.shape[1]] + [wid] * lay + [1]
    activation = 'selu'
    initializer = 'LeCun normal'
    regularization = ['l2', 0.01]
    
    loss = 'MAPE'
    optimizer = 'adam'
    lr = 0.0001 if data.train_x.shape[1] == 3 else 0.001
    epochs = 30000
    net = dde.maps.FNN(
        layer_size, activation, initializer, regularization=regularization
    )
    model = dde.Model(data, net)
    model.compile(optimizer, lr=lr, loss=loss, metrics=['MAPE'])
    losshistory, train_state = model.train(epochs=epochs)
    dde.saveplot(losshistory, train_state, issave=True, isplot=False)
    return train_state.best_metrics[0]

def mfnn(data, lay, wid, xdim):
    #lay, wid = 2, 128
    x_dim, y_dim = xdim, 1
    activation = 'selu'
    initializer = 'LeCun normal'
    regularization = ['l2', 0.01]
    net = dde.maps.MfNN(
        [x_dim] + [wid] * lay + [y_dim],
        [8] * lay + [y_dim],
        activation,
        initializer,
        regularization=regularization,
        residue=True,
        trainable_low_fidelity=True,
        trainable_high_fidelity=True
    )

    model = dde.Model(data, net)
    model.compile('adam', lr=0.0001, loss='MAPE', metrics=['MAPE', 'APE SD'])
    losshistory, train_state = model.train(epochs=30000)

    dde.saveplot(losshistory, train_state, issave=True, isplot=False)
    return (
        train_state.best_metrics[1],
        train_state.best_metrics[3],
        train_state.best_y[1],
    )

def pde_Er(x, y):
    # x1 = C, x2 = dP/dh, x3 = Wp/Wt, x4 = hm
    # Er=sqrt(pi)(dP/dh)/(2hmax\sqrt(24.5))
    # x0 = 0
    x1 = x[:,1]
    # x2 = 0
    x3 = x[:,3]
    return 1e-3*np.sqrt(np.pi) * x1 / (2 * x3 * np.sqrt(24.5)) - y

def pde_sy(x, y):
    # x1 = C, x2 = dP/dh, x3 = Wp/Wt, x4 = hm
    # sy=Pm/3Ac=Pm/73.5hm^2=C/73.5
    x0 = x[:,0]
    # x1 = 0
    # x2 = 0
    # x3 = 0
    return x0/73.5 - y 

def sol_Er(x):
    return 1e-3*np.sqrt(np.pi) * x[1] / (2 * x[3] * np.sqrt(24.5))

def sol_sy(x):
    return x[0] / 73.5

# Generate "physical model" training data
def gen_traindata(num, yname):
    C_l, C_h = 2.5, 250
    dPdh_l, dPdh_h = 10000, 300000
    WpWt_l, WpWt_h = 0.4, 0.9
    hm_l, hm_h = 0.1, 0.4
    x1 = np.linspace(C_l, C_h, num)
    x2 = np.linspace(dPdh_l, dPdh_h, num)
    x3 = np.linspace(WpWt_l, WpWt_h, num)
    x4 = np.linspace(hm_l, hm_h, num)
    X = np.column_stack((x1, x2, x3, x4))
    
    if yname == 'Er':
        Y = 1e-3*np.sqrt(np.pi)*x2/(2*x4*np.sqrt(24.5))
    if yname == 'sy':
        Y = x1 / 73.5
    return X, Y

class TestCallback(dde.callbacks.Callback):
    def __init__(self, X_test, y_test, period=1000):
        super().__init__()
        self.X_test = X_test
        self.y_test = y_test
        self.period = period
        self.test_errors = []
        self.current_epoch = 0

    def on_epoch_end(self):
        self.current_epoch += 1
        if self.current_epoch % self.period == 0:
            y_pred = self.model.predict(self.X_test)
            error = np.mean(np.abs((self.y_test - y_pred) / self.y_test)) * 100
            self.test_errors.append(error)

def pinn_one(yname, testname, trainname, n_hi, n_vd=0.2, lay=2, wid=32):
    # Generate model data
    geom = dde.geometry.Hypercube([-1, -1, -1, -1], [1, 1, 1, 1])
    X_model, y_model = gen_traindata(1000, yname)
    generated = dde.icbc.PointSetBC(X_model, y_model, component=0)

    if yname == 'Er':
        bc = dde.icbc.DirichletBC(geom, sol_Er, lambda _, on_boundary: on_boundary, component=0)
    if yname == 'sy':
        bc = dde.icbc.DirichletBC(geom, sol_sy, lambda _, on_boundary: on_boundary, component=0)
    
    # Get experimental training and test data
    datatrain = FileData(trainname, yname)
    datatest = FileData(testname, yname)
    longest = max([datatrain.y, datatest.y], key=len)

    # Define boundary condition using experimental data
    datafile = dde.icbc.PointSetBC(datatrain.X, datatrain.y, component=0)
    
    if n_hi == 0: 
        train_size = 10
        test_size = len(datatest.X) - train_size
    else:
        train_size = n_hi
        test_size = min(len(datatrain.X) - n_hi, len(datatrain.X) - train_size - 1)

    kf = ShuffleSplit(
        n_splits=10,
        train_size=train_size,
        test_size=test_size,
        random_state=0
    )

    mape = []
    iter = 0
    for train_index, test_index in kf.split(longest):
        iter += 1
        print(f"Iteration {iter}")

        datatrain.X, datatest.X = datatrain.X[train_index*len(datatrain.X)//len(longest)], datatest.X[test_index*len(datatest.X)//len(longest)]
        datatrain.y, datatest.y = datatrain.y[train_index*len(datatrain.y)//len(longest)], datatest.y[test_index*len(datatest.y)//len(longest)]

        if n_hi > 0:
            # Create the PDE problem
            if yname == 'Er':
                data = dde.data.PDE(
                    geom,
                    pde_Er,
                    [bc, generated, datafile],
                    num_domain=100,
                    num_boundary=100,
                    num_test=100,
                )
            if yname == 'sy':
                data = dde.data.PDE(
                    geom,
                    pde_sy,
                    [bc, generated, datafile],
                    num_domain=100,
                    num_boundary=100,
                    num_test=100,
                )
        else:
            if yname == 'Er':
                data = dde.data.PDE(
                    geom,
                    pde_Er,
                    [bc, generated],
                    num_domain=100,
                    num_boundary=100,
                    num_test=100,
                )
            if yname == 'sy':
                data = dde.data.PDE(
                    geom,
                    pde_sy,
                    [bc, generated],
                    num_domain=100,
                    num_boundary=100,
                    num_test=100,
                )
    
        # Define neural network
        layer_size = [data.train_x.shape[1]] + [wid] * lay + [1]
        activation = 'tanh'
        initializer = 'Glorot uniform'
        net = dde.maps.FNN(layer_size, activation, initializer)
        model = dde.Model(data, net)
        model.compile("adam", lr=0.001)
        test_callback = TestCallback(datatest.X, datatest.y, period=1000)
        losshistory, train_state = model.train(epochs=30000, callbacks=[test_callback])

        # Calculate final mean percent error
        y_pred = model.predict(datatest.X)
        mape.append(np.mean(np.abs((datatest.y - y_pred) / datatest.y)) * 100)

    print(f"Mean percent error: {np.mean(mape)}±{np.std(mape)}%")

    with open('output.txt', 'a') as f:
        f.write('pinn_one ' + yname + ' ' + str(np.mean(mape)) + ' ' + str(np.std(mape)) + ' ' + t2s(testname) + ' ' + t2s(trainname) + ' ' + str(n_hi) + ' ' + str(n_vd) + ' ' + str(lay) + ' ' + str(wid) + '\n')

    return

class KANModel(tnn.Module):
    def __init__(self, input_dim, hidden_dim, output_dim, num_layers):
        super(KANModel, self).__init__()
        self.layers = tnn.ModuleList()
        self.layers.append(kan.KAN(width=[input_dim, hidden_dim], grid=3, k=3))
        for _ in range(num_layers - 1):
            self.layers.append(kan.KAN(width=[hidden_dim, hidden_dim], grid=3, k=3))
        self.layers.append(kan.KAN(width=[hidden_dim, output_dim], grid=3, k=3))

    def forward(self, x):
        for layer in self.layers:
            x = layer(x)
        return x

def kan_model(data, lay, wid):
    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
    X_train = torch.FloatTensor(data.train_x).to(device)
    y_train = torch.FloatTensor(data.train_y).to(device)
    X_test = torch.FloatTensor(data.test_x).to(device)
    y_test = torch.FloatTensor(data.test_y).to(device)
    
    # Create DataLoader
    train_dataset = TensorDataset(X_train, y_train)
    train_loader = DataLoader(train_dataset, batch_size=32, shuffle=True)
    
    input_dim = X_train.shape[1]
    model = KANModel(input_dim, wid, 1, lay).to(device)
    
    criterion = tnn.L1Loss()  # MAE loss, similar to MAPE
    optimizer = optim.Adam(model.parameters(), lr=0.001)
    
    epochs = 30000
    for epoch in range(epochs):
        model.train()
        for batch_X, batch_y in train_loader:
            optimizer.zero_grad()
            outputs = model(batch_X)
            loss = criterion(outputs, batch_y)
            loss.backward()
            optimizer.step()
        
        if (epoch + 1) % 100 == 0:
            print(f'Epoch [{epoch+1}/{epochs}], Loss: {loss.item():.4f}')
    
    model.eval()
    with torch.no_grad():
        y_pred = model(X_test)
        mape = torch.mean(torch.abs((y_test - y_pred) / y_test)) * 100
    
    return mape.item()

def kan_one(yname, testname, trainname, n_hi, n_vd=0.2, lay=2, wid=32):
    datatrain = FileData(trainname, yname)
    datatest = FileData(testname, yname)
    longest = max([datatrain.y, datatest.y], key=len)

    n_vd = int(n_vd * datatrain.X.shape[0]) if n_vd < 1 else int(n_vd)
    v_ind = np.random.choice(datatrain.X.shape[0], size=n_vd, replace=False)
    t_ind = np.setdiff1d(np.arange(datatrain.X.shape[0]), v_ind)
    dataval = FileData(testname, yname)
    dataval.X = datatrain.X[v_ind]
    dataval.y = datatrain.y[v_ind]
    datatrain.X = datatrain.X[t_ind]
    datatrain.y = datatrain.y[t_ind]

    train_size = n_hi
    test_size = min(len(datatrain.X) - n_hi, len(datatrain.X) - train_size - 1)

    kf = ShuffleSplit(
        n_splits=10,
        train_size=train_size,
        test_size=test_size,
        random_state=0
    )

    mape = []
    iter = 0
    for train_index, test_index in kf.split(longest):
        iter += 1
        print('\nCross-validation iteration: {}'.format(iter))

        X_train, X_test = datatrain.X[train_index*len(datatrain.X)//len(longest)], datatest.X[test_index*len(datatest.X)//len(longest)]
        y_train, y_test = datatrain.y[train_index*len(datatrain.X)//len(longest)], datatest.y[test_index*len(datatest.X)//len(longest)]

        # Create a data object similar to what dde.data.DataSet provides
        class Data:
            def __init__(self, X_train, y_train, X_test, y_test):
                self.train_x = X_train
                self.train_y = y_train
                self.test_x = X_test
                self.test_y = y_test

        data = Data(X_train, y_train, X_test, y_test)
        mape.append(kan_model(data, lay, wid))

    print(mape)
    print(yname, n_hi, np.mean(mape), np.std(mape))
    with open('output.txt', 'a') as f:
        f.write('kan_one ' + yname + ' ' + f'{np.mean(mape):.2f}' + ' ' + f'{np.std(mape):.2f}' + ' ' + t2s(testname) + ' ' + t2s(trainname) + ' ' + str(n_hi) + ' ' + str(n_vd) + ' ' + str(lay) + ' ' + str(wid) + '\n')
    return

def nn_one(yname, testname, trainname, n_hi, n_vd=0.2, lay=2, wid=32):
    datatrain = FileData(trainname, yname)
    datatest = FileData(testname, yname)

    n_vd = int(n_vd * datatrain.X.shape[0]) if n_vd < 1 else int(n_vd)
    v_ind = np.random.choice(datatrain.X.shape[0], size=n_vd, replace=False)
    t_ind = np.setdiff1d(np.arange(datatrain.X.shape[0]), v_ind)
    dataval = FileData(testname, yname)
    dataval.X = datatrain.X[v_ind]
    dataval.y = datatrain.y[v_ind]
    datatrain.X = datatrain.X[t_ind]
    datatrain.y = datatrain.y[t_ind]
    longest = max([datatrain.y, datatest.y], key=len)

    if n_hi == 0: 
        train_size = 10
        test_size = len(datatest.X) - train_size
    else:
        train_size = n_hi
        test_size = min(len(datatrain.X) - n_hi, len(datatrain.X) - train_size - 1)

    kf = ShuffleSplit(
        n_splits=10,
        train_size=train_size,
        test_size=test_size,
        random_state=0
    )

    mape = []
    iter = 0
    for train_index, test_index in kf.split(longest):
        iter += 1
        print('\nCross-validation iteration: {}'.format(iter))

        X_train, X_test = datatrain.X[train_index*len(datatrain.X)//len(longest)], datatest.X[test_index*len(datatest.X)//len(longest)]
        y_train, y_test = datatrain.y[train_index*len(datatrain.X)//len(longest)], datatest.y[test_index*len(datatest.X)//len(longest)]

        data = dde.data.DataSet(
            X_train=X_train, y_train=y_train, X_test=X_test, y_test=y_test, standardize=True
        )
        mape.append(dde.utils.apply(nn, (data,lay,wid,)))

    print(mape)
    print(yname, n_hi, np.mean(mape), np.std(mape))
    with open('output.txt', 'a') as f:
        f.write('nn_one ' + yname + ' ' + f'{np.mean(mape):.2f}' + ' ' + f'{np.std(mape):.2f}' + ' ' + t2s(testname) + ' ' + t2s(trainname) + ' ' + str(n_hi) + ' ' + str(n_vd) + ' ' + str(lay) + ' ' + str(wid) + '\n')
    
    return

def mfnn_two(yname, testname, trainhigh, n_hi, trainlow, n_lo, v_lo=0, n_vd=0.2, lay=2, wid=128):
    datalow = FileData(trainlow, yname)
    datahigh = FileData(trainhigh, yname)
    datatest = FileData(testname, yname)

    n_vd = int(n_vd * datahigh.X.shape[0]) if n_vd < 1 else int(n_vd)
    v_ind = np.random.choice(datahigh.X.shape[0], size=n_vd, replace=False)
    t_ind = np.setdiff1d(np.arange(datahigh.X.shape[0]), v_ind)
    dataval = FileData(testname, yname)
    dataval.X = datahigh.X[v_ind]
    dataval.y = datahigh.y[v_ind]
    datahigh.X = datahigh.X[t_ind]
    datahigh.y = datahigh.y[t_ind]
    longest = max([datalow.y, datahigh.y, datatest.y], key=len)

    datalow.y *= 1 + v_lo * np.random.normal(loc=0, scale=1, size=datalow.y.shape)

    mape = []
    iter = 0

    if n_hi == 0:
        kf = ShuffleSplit(
            n_splits=10,
            train_size=10,
            test_size=len(datatest.X) - train_size,
            random_state=0
        )
        for train_index, test_index in kf.split(longest):
            iter += 1
            print('\nCross-validation iteration: {}'.format(iter))
            train_index = train_index*len(datalow.X)//len(longest)
            X_train, X_test = datalow.X[train_index*len(datalow.X)//len(longest)], datatest.X[test_index*len(datalow.X)//len(longest)]
            y_train, y_test = datalow.y[train_index*len(datalow.X)//len(longest)], datatest.y[test_index*len(datalow.X)//len(longest)]
            data = dde.data.DataSet(
                X_train=X_train, y_train=y_train, X_test=X_test, y_test=y_test, standardize=True
            )
            mape.append(dde.utils.apply(nn, (data,lay,wid,)))

    else:
        train_size = n_hi
        test_size = min(len(datahigh.X) - n_hi, len(datahigh.X) - train_size - 1)
        kf = ShuffleSplit(
            n_splits=10,
            train_size=train_size,
            test_size=test_size,
            random_state=0
        )
        for train_index, test_index in kf.split(longest):
            iter += 1
            print('\nIteration: {}'.format(iter), flush=True)

            lo_index = np.random.choice(datalow.X.shape[0], size=n_lo, replace=False)
            data = dde.data.MfDataSet(
                X_lo_train=datalow.X[lo_index],
                X_hi_train=datahigh.X[train_index*len(datahigh.X)//len(longest)],
                y_lo_train=datalow.y[lo_index],
                y_hi_train=datahigh.y[train_index*len(datahigh.X)//len(longest)],
                X_hi_test=datatest.X[test_index*len(datatest.X)//len(longest)],
                y_hi_test=datatest.y[test_index*len(datatest.X)//len(longest)],
                standardize=True
            )
            mape.append(dde.utils.apply(mfnn, (data, lay, wid, 4, ))[0])

    with open('output.txt', 'a') as f:
        f.write('mfnn_two ' + yname + ' ' + f'{np.mean(mape, axis=0):.2f}' + ' ' + f'{np.std(mape, axis=0):.2f}' + ' ' + t2s(testname) + ' ' + t2s(trainhigh) + ' ' + str(n_hi) + ' ' + t2s(trainlow) + ' ' + str(n_lo) + ' ' + str(v_lo) + ' ' + str(n_vd) + ' ' + str(lay) + ' ' + str(wid) + '\n')
    print(np.std(mape))
    print(mape)
    print(yname, 'mfnn_two ', t2s(trainlow), ' ', t2s(trainhigh), ' ', str(n_hi), ' ', np.mean(mape), np.std(mape))

    return

def mfnn_three(yname, testname, trainexp, n_exp, trainhigh, n_hi, trainlow, n_lo, typ='hi', n_vd=0.2, v_lo=0, v_hi=0, lay=2, wid=128):
    datalow = FileData(trainlow, yname)
    datahigh = FileData(trainhigh, yname)
    dataexp = FileData(trainexp, yname)
    datatest = FileData(testname, yname)
    longest = max([datalow.y, datahigh.y, dataexp.y, datatest.y], key=len)

    n_vd = (int(n_vd * dataexp.X.shape[0])) if n_vd < 1 else int(n_vd)
    v_ind = np.random.choice(dataexp.X.shape[0], size=n_vd, replace=False)
    t_ind = np.setdiff1d(np.arange(dataexp.X.shape[0]), v_ind)
    dataval = FileData(testname, yname)
    dataval.X = dataexp.X[v_ind]
    dataval.y = dataexp.y[v_ind]
    dataexp.X = dataexp.X[t_ind]
    dataexp.y = dataexp.y[t_ind]

    datalow.y *= 1 + v_lo * np.random.normal(loc=0, scale=1, size=datalow.y.shape)
    datahigh.y *= 1 + v_hi * np.random.normal(loc=0, scale=1, size=datahigh.y.shape)

    ape = []
    y = []

    if n_exp == 0:
        kf = ShuffleSplit(
            n_splits=10,
            train_size=10,
            test_size=len(datatest.X) - train_size,
            random_state=0
        )
        if typ == 'hi':
            for train_index, test_index in kf.split(longest):
                iter += 1
                print('\nIteration: {}'.format(iter), flush=True)

                lo_index = np.random.choice(datalow.X.shape[0], size=n_lo, replace=False)  
                data = dde.data.MfDataSet(
                    X_lo_train=datalow.X[lo_index],
                    X_hi_train=datahigh.X[train_index*len(datahigh.X)//len(longest)],
                    y_lo_train=datalow.y[lo_index],
                    y_hi_train=datahigh.y[train_index*len(datahigh.X)//len(longest)],
                    X_hi_test=datatest.X[test_index*len(datatest.X)//len(longest)],
                    y_hi_test=datatest.y[test_index*len(datatest.X)//len(longest)],
                    standardize=True
                )
                ape.append(dde.utils.apply(mfnn, (data, lay, wid, 4, ))[0])
        else:
            for train_index, test_index in kf.split(longest):
                iter += 1
                print('\nCross-validation iteration: {}'.format(iter))
                lo_index = np.random.choice(datalow.X.shape[0], size=n_lo, replace=False)
                hi_index = np.random.choice(datahigh.X.shape[0], size=n_hi, replace=False)
                datatrain = datalow
                datatrain.X = np.vstack((datalow.X[lo_index], datahigh.X[hi_index]))
                datatrain.y = np.vstack((datalow.y[lo_index], datahigh.y[hi_index]))
                X_train, X_test = datatrain.X[train_index*len(datatrain.X)//len(longest)], datatest.X[test_index*len(datatest.X)//len(longest)]
                y_train, y_test = datatrain.y[train_index*len(datatrain.X)//len(longest)], datatest.y[test_index*len(datatest.X)//len(longest)]
                data = dde.data.DataSet(
                    X_train=X_train, y_train=y_train, X_test=X_test, y_test=y_test, standardize=True
                )
                ape.append(dde.utils.apply(nn, (data,lay,wid,)))
    else:
        train_size = n_hi
        test_size = min(len(datahigh.X) - n_hi, len(datahigh.X) - train_size - 1)
        kf = ShuffleSplit(
            n_splits=10,
            train_size=train_size,
            test_size=test_size,
            random_state=0
        )
        for train_index, _ in kf.split(longest):
            print('\nIteration: {}'.format(len(ape)))
            lo_index = np.random.choice(datalow.X.shape[0], size=n_lo, replace=False)
            hi_index = np.random.choice(datahigh.X.shape[0], size=n_hi, replace=False)
            if typ == 'hi':
                data = dde.data.MfDataSet(
                    X_lo_train=datalow.X[lo_index],
                    X_hi_train=np.vstack((datahigh.X[hi_index], dataexp.X[train_index*len(datatrain.X)//len(longest)])),
                    y_lo_train=datalow.y[lo_index],
                    y_hi_train=np.vstack((datahigh.y[hi_index], dataexp.y[train_index*len(datatrain.X)//len(longest)])),
                    X_hi_test=datatest.X,
                    y_hi_test=datatest.y,
                    standardize=True
                )
            else:
                data = dde.data.MfDataSet(
                    X_lo_train=np.vstack((datalow.X[lo_index],datahigh.X[hi_index])),
                    X_hi_train=dataexp.X[train_index*len(datatrain.X)//len(longest)],
                    y_lo_train=np.vstack((datalow.y[lo_index],datahigh.y[hi_index])),
                    y_hi_train=dataexp.y[train_index*len(datatrain.X)//len(longest)],
                    X_hi_test=datatest.X,
                    y_hi_test=datatest.y,
                    standardize=True
                )
            res = dde.utils.apply(mfnn, (data, lay, wid, 4, ))
            ape.append(res[:2])
            y.append(res[2])

    with open('output.txt', 'a') as f:
        f.write('mfnn_three ' + yname + ' ' + f'{np.mean(ape, axis=0)[0]:.2f}' + ' ' + f'{np.std(ape, axis=0)[0]:.2f}' + ' ' + t2s(testname) + ' ' + t2s(trainexp) + ' ' + str(n_exp) + ' ' + t2s(trainhigh) + ' ' + str(n_hi) + ' ' + t2s(trainlow) + ' ' + str(n_lo) + ' ' + typ + ' ' + str(n_vd) + ' ' + str(v_hi) + ' ' + str(v_lo) + ' ' + str(lay) + ' ' + str(wid) + '\n')
        
    return

def find_properties(yname, expname, train_hi, train_lo, lay=2, wid=128):
    datalow = FileData(train_lo, yname)
    datahigh = FileData(train_hi, yname)
    dataexp = FileData(expname, yname, new=True)

    ape = []
    y = []
    
    for _ in range(10):
        print('\nIteration: {}'.format(len(ape)))

        data = dde.data.MfDataSet(
            X_lo_train=datalow.X,
            X_hi_train=datahigh.X,
            y_lo_train=datalow.y,
            y_hi_train=datahigh.y,
            X_hi_test=dataexp.X,
            y_hi_test=dataexp.y,
            standardize=True
        )
        if yname == 'n':
            data.y_lo_train *= 10
            data.y_hi_train *= 10
            res = dde.utils.apply(mfnn, (data,lay,wid,6,))
            y.append(res[2] / 10)
        elif yname == 's0.033':
            res = dde.utils.apply(mfnn, (data,lay,wid,6,))
            y.append(res[2])
        else:
            res = dde.utils.apply(mfnn, (data, lay, wid, 4,)) 
            y.append(res[2])
        ape.append(res[:2])

    print(np.mean(y, axis=0))
    print(np.std(y, axis=0))
    print(np.mean(np.mean(y, axis=0), axis=0))
    print(np.mean(np.std(y, axis=0), axis=0))

    return(np.mean(np.mean(y, axis=0), axis=0), np.mean(np.std(y, axis=0), axis=0))

def main(argument=None):
    if argument != None:
        exec(argument)
    return

if __name__ == '__main__':
    main()