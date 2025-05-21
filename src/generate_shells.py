import pandas as pd
import string
from itertools import product

# Load the CSV
df = pd.read_csv('../moose/properties.csv')

# Extract the string2D column
params_list = df['string2D'].dropna().tolist()

# Generate alphabetical script names: aa, ab, ac, ...
def alpha_names():
    for first, second in product(string.ascii_lowercase, repeat=2):
        yield f"{first}{second}"

# Template for the shell script
header = """#!/bin/bash 
#SBATCH --time=16:00:00
#SBATCH --nodes=1
#SBATCH -o /dev/null
#SBATCH --ntasks-per-node=32
#SBATCH --account=owner-guest
#SBATCH --partition=notchpeak-guest
#SBATCH --mem=90G  # Added line to request 128 GB of total memory

# Editable parameters
BASE="2D"
ORDER="l"
SUFFIX=""

# Construct the full NAME
NAME="${BASE}_${ORDER}${REF_SUBSTRATE}${SUFFIX}"

# Construct DATADIR and SCRATCH using the updated NAME
DATADIR="/uufs/chpc.utah.edu/common/home/u1015301/moose/groups"
SCRATCH="/scratch/general/vast"

# Construct the input file name
INPUT_FILE="../ind_${BASE}_${ORDER}.i"

# Load necessary modules (adjust as needed)
module purge
module load moose

cd $DATADIR

"""

# Generate scripts
batch_size = 20
for i, name in zip(range(0, len(params_list), batch_size), alpha_names()):
    chunk = params_list[i:i+batch_size]
    body = ""
    for j, line in enumerate(chunk):
        body += f"mpiexec -np $SLURM_NTASKS combined-opt -i $INPUT_FILE \\\n"
        body += f"    -input-params {line} \\\n"
        body += f"    > $DATADIR/$NAME.$SLURM_JOB_ID.out 2>&1\n"

    script = header + body
    with open(f"../moose/2D_{name}.sh", "w") as f:
        f.write(script)
