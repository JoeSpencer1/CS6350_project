#!/bin/bash
#SBATCH --job-name=deepxde_parallel   # Name of your job
#SBATCH --account=zfang               # Your general allocation account
#SBATCH --partition=kingspeak         # Public Kingspeak CPU partition
#SBATCH --nodes=1                     # Run on a single node
#SBATCH --ntasks=1                    # Run a single task...
#SBATCH --cpus-per-task=2             # Request 2 CPU cores (1 for each process)
#SBATCH --time=02:00:00               # Time limit (hh:mm:ss)
#SBATCH --output=slurm_%j.out         # Standard output file
#SBATCH --error=slurm_%j.err          # Standard error file

# (The rest of your script loading modules and running python stays the same)
module purge
module use ~/python_modules
module load deepxde/latest

python runmultiple.py
