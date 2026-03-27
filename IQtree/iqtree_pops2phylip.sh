#!/bin/sh
#
#SBATCH --job-name=pops              # Job Name
#SBATCH --nodes=1             # 40 nodes
#SBATCH --ntasks-per-node=15              # 10 CPU allocation per Task
#SBATCH --partition=sixhour            # Name of the Slurm partition used
#SBATCH --chdir=/home/r110a449/work/Dicaeum  # Set working d$
#SBATCH --mem-per-cpu=5gb            # memory requested
#SBATCH --time=360

#load conda
module load conda
conda activate bioconda

module load stacks #load stacks

# Run populations and export a phyllip
populations -P stacks/ -M popmap/retained_samples_popmap.txt -O ./iqtree --whitelist ./iqtree/dicaeum.unlinked.whitelist.txt --phylip-var-all

conda deactivate