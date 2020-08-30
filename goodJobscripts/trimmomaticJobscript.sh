BATCH --nodes=20
#SBATCH --ntasks-per-node=40
#SBATCH --time=12:00:00
#SBATCH --job-name=trimmomatic
#SBATCH --mail-user=woorachels@gmail.com
#SBATCH --mail-type=ALL

cd /scratch/n/nprovart/raywoo32/trim
module purge
module load NiaEnv/2019b
module load java
module load trimmomatic/.experimental-0.39


java -jar $SCINET_TRIMMOMATIC_ROOT/trimmomatic-0.39.jar -version 0.39 PE $HOME/Data/WT_RNA_R1.fastq.gz $HOME/Data/WT_RNA_R2.fastq.gz $SCRATCH/trimmomaticOutput/output_forward_paired.fq.gz $SCRATCH/trimmomaticOutput/output_forward_unpaired.fq.gz $SCRATCH/trimmomaticOutput/output_reverse_paired.fq.gz $SCRATCH/trimmomaticOutput/output_reverse_unpaired.fq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:36


