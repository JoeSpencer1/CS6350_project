import os  
import numpy as np  
import pandas as pd  
from sklearn.model_selection import KFold, train_test_split  
from pysr import PySRRegressor  

def equation(df, yn, niterations=2000, maxsize=7, test_size=0.15):
    feature_cols = [
        'C (GPa)', 'dP/dh (N/m)', 'Wp/Wt', 'hm (um)',
        f'd{yn}dC', f'd{yn}dS', f'd{yn}dW', f'd{yn}dh',
        f'd2{yn}dCdC', f'd2{yn}dCdS', f'd2{yn}dCdW', f'd2{yn}dCdh',
        f'd2{yn}dSdS', f'd2{yn}dSdW', f'd2{yn}dSdh',
        f'd2{yn}dWdW', f'd2{yn}dWdh', f'd2{yn}dhdh'
    ]
    X = df[feature_cols].values  
    y = df['sy (GPa)'].values  
    
    X_train_full, X_holdout, y_train_full, y_holdout = train_test_split(  
        X, y, test_size=test_size, random_state=0  
    )  
    
    kf = KFold(n_splits=5, shuffle=True, random_state=0)  
    
    best_score = np.inf  
    best_model = None  
    best_eqn = None  
    
    for fold, (train_idx, valid_idx) in enumerate(kf.split(X_train_full), start=1):  
        print(f"\n--- Fold {fold} ---")  
        X_tr, X_vd = X_train_full[train_idx], X_train_full[valid_idx]  
        y_tr, y_vd = y_train_full[train_idx], y_train_full[valid_idx]  
    
        model = PySRRegressor(  
            niterations=niterations,  
            binary_operators=["+", "-", "*", "/"],  
            unary_operators=["exp", "log", "sqrt", "sin", "cos"],  
            model_selection="best",              # keep only the single best equation  
            loss="loss(x, y) = (x - y)^2",
            maxsize=maxsize,                           # must be ≥7  
            populations=20,  
            population_size=min(1000, len(y_tr)+len(y_vd)),  
            procs=4,  
            verbosity=1,  
            random_state=fold,                   # varying seed per fold  
        )  
    
        model.fit(X_tr, y_tr)  
        eqn = model.get_best()                 # best equation string  
        y_vd_pred = model.predict(X_vd)  
        mse = np.mean((y_vd_pred - y_vd) ** 2)  
        print(f"Fold {fold} MSE = {mse:.5f} | Eqn: {eqn}")  
    
        if mse < best_score:  
            best_score = mse  
            best_model = model  
            best_eqn = eqn  
    
    # 5. Evaluate on blind hold-out set  
    y_hold_pred = best_model.predict(X_holdout)  
    mse_hold = np.mean((y_hold_pred - y_holdout) ** 2)  
    
    print("\n=== Summary ===")  
    print(f"Best CV MSE       = {best_score:.5f}")  
    print(f"Best CV Equation  = {best_eqn}")  
    print(f"Held-out MSE      = {mse_hold:.5f}")  

if __name__ == '__main__':
    file_path = os.path.expanduser('~/GitHub/CS6350_project/data/model.csv')  
    df = pd.read_csv(file_path)
    yn = 'sy'
    equation(df, yn, niterations=200, maxsize=9)
    yn = 'Er'
    equation(df, yn, niterations=200, maxsize=9)