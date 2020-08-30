#!/bin/bash
#!/bin/bash
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=40
#SBATCH --time=11:00:00
#SBATCH --job-name=sortAndIndex
#SBATCH --output=sortAndIndex_output_%j.txt
#SBATCH --mail-user=woorachels@gmail.com
#SBATCH --mail-type=ALL

module load gcc
module load samtools
cd /scratch/n/nprovart/raywoo32/AddOrReplaceReadGroups

samtools sort AddedReadGroups.bam -o AddedReadGroups.sorted.bam
samtools index AddedReadGroups.sorted.bam
