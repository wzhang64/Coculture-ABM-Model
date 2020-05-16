#!/bin/bash
#SBATCH -J MATLAB
#SBATCH -t 47:55:00
#SBATCH --array=1-5

# Use '%A' for array-job ID, '%J' for job ID and '%a' for task ID
#SBATCH -e arrayjob-%a.err
#SBATCH -o arrayjob-%a.out

echo "Starting job $SLURM_ARRAY_TASK_ID on $HOSTNAME"
matlab-threaded -nodisplay -r "coculture_model($SLURM_ARRAY_TASK_ID); exit"
module load anaconda/3-5.2.0
#source activate wong_lab
#python coculture_viz.py --job $SLURM_ARRAY_TASK_ID
