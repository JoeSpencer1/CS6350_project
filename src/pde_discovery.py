import os  
import numpy as np  
import pandas as pd  
from sklearn.model_selection import KFold, train_test_split  
from sklearn.metrics import mean_squared_error
from pysr import PySRRegressor
import sympy as sp 

def equation(df, yn, niterations=200, maxsize=20, test_size=0.2, output_file='equation_results.txt'):
    feature_cols = [
        'C (GPa)', 'dP/dh (N/m)', 'Wp/Wt', 'hm (um)',
        f'd{yn}dC', f'd{yn}dS', f'd{yn}dW', f'd{yn}dh',
        f'd2{yn}dCdC', f'd2{yn}dCdS', f'd2{yn}dCdW', f'd2{yn}dCdh',
        f'd2{yn}dSdS', f'd2{yn}dSdW', f'd2{yn}dSdh',
        f'd2{yn}dWdW', f'd2{yn}dWdh', f'd2{yn}dhdh'
    ]
    X = df[feature_cols].values  
    y = df[f'{yn} (GPa)'].values  

    X_train_full, X_holdout, y_train_full, y_holdout = train_test_split(
        X, y, test_size=test_size, random_state=0
    )

    kf = KFold(n_splits=5, shuffle=True, random_state=0)

    best_score = np.inf
    best_model = None
    best_eqn = None

    os.makedirs(os.path.dirname(output_file), exist_ok=True)
    for fold, (train_idx, valid_idx) in enumerate(kf.split(X_train_full), start=1):  # <-- fixed line
        with open(output_file, 'a') as f:  # <-- Make sure this is inside the loop to open and close each time
            X_tr, X_vd = X_train_full[train_idx], X_train_full[valid_idx]
            y_tr, y_vd = y_train_full[train_idx], y_train_full[valid_idx]

            model = PySRRegressor(
                niterations=niterations,
                binary_operators=["+", "-", "*", "/", "^"],
                unary_operators=["exp", "log", "sqrt"],
                model_selection="best",
                elementwise_loss="L2DistLoss()",
                maxsize=maxsize,
                populations=20,
                population_size=min(1000, len(y_tr) + len(y_vd)),
                procs=4,
                verbosity=1,
                random_state=fold,
            )

            model.fit(X_tr, y_tr)
            eqns_df = model.equations_

            best_row = eqns_df.loc[eqns_df['loss'].idxmin()]
            complexity = best_row["complexity"]
            equation_str = best_row["sympy_format"]
            score = best_row["loss"]

            equation_func = equation_to_function(equation_str, feature_cols)
            y_vd_preds = []
            for i in range(X_vd.shape[0]):
                y_vd_pred_i = equation_func(*X_vd[i, :].tolist())  # Convert row to a list to unpack
                y_vd_preds.append(y_vd_pred_i)

            y_vd_preds = np.array(y_vd_preds)
            mse_vd = mean_squared_error(y_vd, y_vd_preds)
            f.write(f"  Best Complexity {complexity} | MSE = {score:.5f} | Validation MSE = {mse_vd:.5f} | Eqn: {equation_str}\n")

            if score < best_score:
                best_score = score
                best_eqn = equation_str
                best_model = model

            eqns_df = model.equations_
            unique_eqns = eqns_df.drop_duplicates(subset=["complexity"])

            for _, row in unique_eqns.iterrows():
                complexity = row["complexity"]
                equation = row["sympy_format"]
                score = row["loss"]

                eq_func = equation_to_function(equation, feature_cols)

                try:
                    y_preds = np.array([eq_func(*x.tolist()) for x in X_vd], dtype=np.float64)
                    if np.isnan(y_preds).any():
                        continue
                    mse_this_eq = mean_squared_error(y_vd, y_preds)

                    f.write(f"  Complexity {complexity} | MSE = {score:.5f} | Validation MSE = {mse_this_eq:.5f} | Eqn: {equation}\n")
                except Exception as e:
                    continue

    if best_model is not None:
        y_hold_pred = best_model.predict(X_holdout)
        mse_hold = np.mean((y_hold_pred - y_holdout) ** 2)

        with open(output_file, 'a') as f:
            f.write("\n=== Summary ===\n")
            f.write(f"Best MSE       = {best_score:.5f}\n")
            f.write(f"Best Equation  = {best_eqn}\n")
            f.write(f"Held-out MSE   = {mse_hold:.5f}\n")
    else:
        print("No best model found. Check the training process.")

def equation_to_function(equation_str, feature_cols):
    equation = sp.sympify(equation_str)
    symbols = [sp.Symbol(f"x{i}") for i in range(len(feature_cols))]
    equation_func = sp.lambdify(symbols, equation, "numpy")
    return equation_func

if __name__ == '__main__':
    fname = 'model'
    file_path = os.path.expanduser(f'~/GitHub/CS6350_project/data/{fname}.csv')  
    df = pd.read_csv(file_path)
    yn = 'sy'
    equation(df, yn, output_file=f'equations/{yn}_{fname}.txt')
    yn = 'Er'
    equation(df, yn, output_file=f'equations/{yn}_{fname}.txt')
