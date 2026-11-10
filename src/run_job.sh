#!/bin/bash
#SBATCH --job-name=deepxde_parallel   # Name of your job
#SBATCH --account=owner-gpu           # Replace with your CHPC allocation/account (e.g., kingspeak-gpu or owner-gpu)
#SBATCH --partition=kingspeak         # Partition/cluster to submit to
#SBATCH --nodes=1                     # Run on a single node
#SBATCH --ntasks=1                    # Run a single task...
#SBATCH --cpus-per-task=2             # ...but request 2 CPU cores (1 for each parallel process)
#SBATCH --time=02:00:00               # Time limit (hh:mm:ss)
#SBATCH --output=slurm_%j.out         # Standard output file (%j expands to job ID)
#SBATCH --error=slurm_%j.err          # Standard error file

# 1. Clear any pre-existing environment modules
module purge

# 2. Tell Lmod where your custom modules are located
module use ~/python_modules

# 3. Load your custom environment module (this handles Miniforge and your paths natively)
module load deepxde/latest

# 4. Run your python script (replace 'myscript.py' with your actual Python filename)
python runmultiple.py
