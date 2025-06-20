#!/bin/bash
#SBATCH -J IFML-A
#SBATCH -p gh
#SBATCH -t 24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH -o logs/gpu_%j.out
#SBATCH -e logs/gpu_%j.err

# Load necessary modules or environments here
# module load cuda/xx.x python/xx.x etc.

# Check GPU availability
echo "[INFO] Checking GPU..."
nvidia-smi

# Run your actual task here (replace with your actual command)
echo "[INFO] Starting GPU task..."
rm ~/.cursor/cli/tunnel-stable.lock
~/cursor tunnel  # or replace with your actual task
