#!/bin/sh

#SBATCH --time=02:00:00
#SBATCH --nodes=2
#SBATCH -A tud01
#SBATCH -p GpuQ
#SBATCH --mail-user=<email_address>
#SBATCH --mail-type=BEGIN,END
#SBATCH --job-name=DM_Training_16

module load cuda/10.1.243 gcc conda intel/2019u5

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/ichec/packages/conda/2/pkgs/cudnn-7.6.0-cuda10.1_0/lib

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/ichec/packages/conda/2/envs/cpu_tf1.14_torch1.1_hvd0.16/lib/

conda activate mrcnn_tf2

WORKING_DIR=/ichec/home/users/<dir>/DeepMapper/DNN

cd $WORKING_DIR

python -u train.py