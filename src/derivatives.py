from data import FileData
import numpy as np
from sklearn.neighbors import NearestNeighbors
import numpy as np

def derivatives(prop):
    X = f'data_{prop}'.X
    y = f'data_{prop}'.y

    result = estimate_jacobian(X, y)
    for row in result:
        print(row)
    result = estimate_hessian(X, y)
    for row in result:
        print(row)

def estimate_jacobian(X, y, k=10):
    n_samples, n_features = X.shape
    gradients = np.zeros((n_samples, n_features))

    nbrs = NearestNeighbors(n_neighbors=k+1, algorithm='auto').fit(X)
    distances, indices = nbrs.kneighbors(X)

    for i in range(n_samples):
        neigh_idx = indices[i][1:]  # exclude self
        X_neigh = X[neigh_idx] - X[i]
        y_neigh = y[neigh_idx] - y[i]

        # Solve least squares: X_neigh @ grad ≈ y_neigh
        grad_i, _, _, _ = np.linalg.lstsq(X_neigh, y_neigh, rcond=None)
        gradients[i] = grad_i.flatten()

    return gradients

def estimate_hessian(X, y, k=20):
    n_samples, n_features = X.shape
    hessians = np.zeros((n_samples, n_features, n_features))

    # Prepare nearest neighbors
    nbrs = NearestNeighbors(n_neighbors=k+1, algorithm='auto').fit(X)
    _, indices = nbrs.kneighbors(X)

    def make_quadratic_features(x):
        """Generate features: [x1, ..., xn, x1^2, x1*x2, ..., xn^2]"""
        x = x.reshape(-1, 1)
        linear = x.flatten()
        quad = np.array([x[i] * x[j] for i in range(n_features) for j in range(i, n_features)])
        return np.hstack((linear, quad.flatten()))

    for i in range(n_samples):
        neigh_idx = indices[i][1:]  # exclude self
        X_diff = X[neigh_idx] - X[i]  # center at current point
        y_diff = y[neigh_idx] - y[i]

        # Construct design matrix with linear + quadratic terms
        X_design = np.array([make_quadratic_features(x) for x in X_diff])
        coeffs, _, _, _ = np.linalg.lstsq(X_design, y_diff, rcond=None)

        # Extract second-order coefficients and build symmetric Hessian
        H = np.zeros((n_features, n_features))
        idx = 0
        for j in range(n_features):
            for k in range(j, n_features):
                value = coeffs[n_features + idx]
                H[j, k] = value
                idx += 1

        hessians[i] = H

    return hessians

def derivatives(fname, prop, features=['C', 'S', 'W', 'h']):
    data = FileData(fname, prop)
    X = data.X
    y = data.y

    result = estimate_jacobian(X, y)
    for row in result:
        print(row)
    for i in range(len(features)):
        data.addprop(f'd{prop}d{features[i]}', result[:,i])
    result = estimate_hessian(X, y)
    for row in result:
        print(row)
    for i in range(len(features)):
        for j in range(i,len(features)):
            data.addprop(f'd2{prop}d{features[i]}d{features[j]}', result[:,i,j])

fname = 'model'
data_sy = FileData(fname, 'sy')
data_Er = FileData(fname, 'Er')

derivatives(fname, 'sy')
derivatives(fname, 'Er')