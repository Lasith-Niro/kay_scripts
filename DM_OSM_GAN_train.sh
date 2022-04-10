#!/bin/sh

#SBATCH --time=02:00:00
#SBATCH --nodes=2
#SBATCH -A condominium_name
#SBATCH -p GpuQ
#SBATCH --mail-user=myemailid@universityname.ie
#SBATCH --mail-type=BEGIN,END
#SBATCH --job-name=OSM_GAN_T1

module load cuda/10.1.243 gcc conda intel/2019u5

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/ichec/packages/conda/2/pkgs/cudnn-7.6.0-cuda10.1_0/lib

source activate torch
WORKING_DIR=/ichec/work/condominium_name/username/osm-gan
cd $WORKING_DIR
python -u train.py --dataroot ../data/Google_OSi_24bit_z19/ --name Google_OSi_24bit_z19 --model pix2pix 
--direction AtoB --save_epoch_freq 50