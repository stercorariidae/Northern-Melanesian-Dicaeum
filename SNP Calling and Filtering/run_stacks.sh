#!/bin/sh
#
#SBATCH --job-name=pops              # Job Name
#SBATCH --nodes=1             # 40 nodes
#SBATCH --ntasks-per-node=15              # 10 CPU allocation per Task
#SBATCH --partition=bi            # Name of the Slurm partition used
#SBATCH --chdir=/home/r110a449/work/Dicaeum  # Set working d$
#SBATCH --mem-per-cpu=5gb            # memory requested
#SBATCH --time=3000

files="D_aen_32085a
D_aen_32085b
D_aen_32085c
D_aen_32013
D_aen_32018
D_aen_32000
D_aen_32020
D_aen_32050
D_aen_32044
D_aen_34914
D_aen_34886
D_aen_34884
D_aen_34849
D_aen_34850
D_aen_34845
D_aen_34844
D_aen_34495
D_aen_34500
D_aen_34496
D_aen_34497
D_aen_34487
D_aen_34479
D_aen_32799
D_aen_32847
D_aen_32808
D_aen_32801
D_aen_32732
D_aen_32736
D_aen_32729
D_aen_32738
D_aen_32765
D_aen_32787
D_aen_32775
D_tris_35052
D_tris_35064
D_tris_35032
D_tris_35029
D_tris_34951
D_tris_35000
D_tris_35018
D_tris_34956
D_tris_35069
D_tris_13531
D_tris_13542
D_exi_27673
D_exi_27655
D_exi_27667
D_exi_27683
D_exi_27697
D_geel_12896
D_geel_4777
D_geel_16476
D_geel_14636
D_exi_27676
D_exi_27690
D_exi_27695
D_exi_27715
D_exi_27756
D_geel_31391
D_hir_34221
D_hir_8821
D_hir_8838
D_hir_22673
D_hir_6156
D_exi_27657a
D_exi_27657b
D_aen_32085
D_aen_32777
D_aen_34852
D_aen_34871
D_exi_27854
D_con_10365
D_con_10435
D_con_10391
D_con_23425
"

#load conda
module load conda
conda activate bioconda

#index ref
#bwa index ./reference_gen/d_eximium.fna

#Align paired-end data with BWA, convert to BAM and SORT.
#for sample in $files
#do 
 #   bwa mem -t 15 ./reference_gen/d_eximium.fna ./fastq/${sample}.fq.gz |
  #    samtools view -b |
   #   samtools sort > fastq/${sample}.bam
#done

#Run gstacks to build loci from the aligned paired-end data.
#We have instructed gstacks to remove any PCR duplicates that it finds.
module load stacks #load stacks
#gstacks -I fastq/ -M popmap/popmap.txt -O ./stacks -t 15 #run gstacks

# Run populations and export a vcf. Do filtering steps on the output vcf.
populations -P stacks/ -M popmap/popmap.txt -O ./populations --vcf --hwe --fstats --treemix -t 15 #run populations

conda deactivate
