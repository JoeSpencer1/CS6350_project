import pandas as pd
import glob
import os

# Load the existing summary file
summary_path = "../data/FEM_MOOSE_2D.csv"
summary_df = pd.read_csv(summary_path)

# Helper to extract data from each simulation CSV
def process_csv(file_path):
    df = pd.read_csv(file_path)
    df = df.sort_values("time").reset_index(drop=True)

    # Interpolation around time = 1.00
    i = df[df["time"] <= 1.0].iloc[-1].name
    W1 = df.loc[i, "W"]
    h1 = df.loc[i, "disp_y_top"]
    P1 = df.loc[i, "react_y_top"]

    # Immediately after time 1.0
    h2 = df.loc[i+1, "disp_y_top"]
    P2 = df.loc[i+1, "react_y_top"]

    # Final values
    Wp = df["W"].iloc[-1]

    # Calculations
    WpWt = Wp / W1
    hm = h1 # um
    C = P1 / (h1 ** 2) # GPa*um^2/um^2
    dPdh = 1000 * (P2 - P1) / (h2 - h1)

    return WpWt, hm, C, dPdh

# Process each CSV and update summary_df
input_files = glob.glob("../moose/*.csv")

for file_path in input_files:
    try:
        filename = os.path.basename(file_path)
        ID = filename[:3]  # match on first 3 characters

        WpWt, hm, C, dPdh = process_csv(file_path)

        # Find matching row in summary_df by ID
        match = summary_df["ID"].astype(str).str.startswith(ID)
        if match.any():
            summary_df.loc[match, "Wp/Wt"] = WpWt
            summary_df.loc[match, "C (GPa)"] = C
            summary_df.loc[match, "dP/dh (N/m)"] = dPdh
        else:
            print(f"No matching ID found for {filename}")
    except Exception as e:
        print(f"Error processing {file_path}: {e}")

# Save the updated summary
summary_df.to_csv(summary_path, index=False)