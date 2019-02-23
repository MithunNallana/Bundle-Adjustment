#!/bin/bash
#SBATCH -A research
#SBATCH -p long
#SBATCH -n 20
#SBATCH --time=1-00:00:00
#SBATCH --mail-type=END

module load matlab/R2017b

matlab -nodesktop -nosplash < launch.m
