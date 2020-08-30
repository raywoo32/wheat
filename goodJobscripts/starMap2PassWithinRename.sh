#!/bin/bash
#!/bin/bash
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=40
#SBATCH --time=16:00:00
#SBATCH --job-name=starMapWithin
#SBATCH --output=star_within_output_%j.txt
#SBATCH --mail-user=woorachels@gmail.com
#SBATCH --mail-type=ALL

cd /scratch/n/nprovart/raywoo32/starWithin
module load gcc/7.3.0
module load star 

STAR --runThreadN 8 --genomeDir ../starRename --twopassMode Basic --runMode alignReads -outSAMunmapped Within --readFilesIn /scratch/n/nprovart/raywoo32/starData/R1.fastq /scratch/n/nprovart/raywoo32/starData/R2.fastq


