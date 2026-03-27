#!/bin/sh
#
#SBATCH --job-name=iqtree               # Job Name
#SBATCH --nodes=1             # 40 nodes
#SBATCH --ntasks-per-node=15               # 40 CPU allocation per Task
#SBATCH --partition=sixhour         # Name of the Slurm partition used
#SBATCH --chdir=/home/r110a449/work/Dicaeum/iqtree  # Set working d$
#SBATCH --mem-per-cpu=2gb            # memory requested
#SBATCH --time=360

module load bioconda

#-s specifies the input sequence data
#-m MFP specifies to perform model testing and use the best model of sequence evolution
#-bb specifies performing 1000 ultrafast bootstraps to assess support
#-nt AUTO allows the program to use the optimal number of threads (15 specified here)
iqtree2 -s pops.phy -m MFP -bb 1000 -nt AUTO