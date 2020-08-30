#!/bin/bash
#!/bin/bash
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=40
#SBATCH --time=23:00:00
#SBATCH --job-name=splitNCigar
#SBATCH --output=splitNCigar_output_%j.txt
#SBATCH --mail-user=woorachels@gmail.com
#SBATCH --mail-type=ALL


module load NiaEnv/2019b
module load java 
module load python 
module load gatk/4.1.7.0  
cd /scratch/n/nprovart/raywoo32/splitCigar

gatk SplitNCigarReads \
      -R /scratch/n/nprovart/raywoo32/mergeBamData/T1ShortNames.fa \
      -I /scratch/n/nprovart/raywoo32/markDuplicates/marked_duplicates.bam  \
      -O ./splitNCigar.bam
  
