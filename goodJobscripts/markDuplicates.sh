#!/bin/bash
#!/bin/bash
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=40
#SBATCH --time=8:00:00
#SBATCH --job-name=markduplicates
#SBATCH --output=markduplicates_output_%j.txt
#SBATCH --mail-user=woorachels@gmail.com
#SBATCH --mail-type=ALL

cd /scratch/n/nprovart/raywoo32
module load java
module load gcc

java -jar /scratch/n/nprovart/raywoo32/software/Picard/picard.jar MarkDuplicates I=/scratch/n/nprovart/raywoo32/starWithin/sample.sort.sam  O=./markDuplicates/marked_duplicates.bam M=./markDuplicates/marked_dup_metrics.txt



