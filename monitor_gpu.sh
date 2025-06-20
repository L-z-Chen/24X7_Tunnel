#!/bin/bash

# Configuration
JOB_NAME="IFML-A"
JOB_SCRIPT="gpu_tunnel_job.sh"
CHECK_INTERVAL=120  # Check every 120 seconds (2 minutes)

# Function to check if the job is active (running or queued)
is_job_active() {
    squeue -h -n "$JOB_NAME" | grep -w "$JOB_NAME" > /dev/null 2>&1
    return $?
}

# Function to submit the job
submit_job() {
    echo "[`date`] [INFO] Submitting job '$JOB_NAME'..."
    sbatch "$JOB_SCRIPT"
}

# Main monitoring loop
echo "[`date`] [BOOT] Starting job monitor for '$JOB_NAME'..."

while true; do
    if is_job_active; then
        echo "[`date`] [OK] Job '$JOB_NAME' is running or queued."
    else
        echo "[`date`] [WARN] Job '$JOB_NAME' not found. Resubmitting..."
        submit_job
    fi
    sleep "$CHECK_INTERVAL"
done
