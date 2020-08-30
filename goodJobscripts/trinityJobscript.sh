#!/bin/bash
#!/bin/bash
#SBATCH --nodes=20
#SBATCH --ntasks-per-node=40
#SBATCH --time=24:00:00
#SBATCH --job-name=trinity1
#SBATCH --mail-user=woorachels@gmail.com
#SBATCH --mail-type=ALL

module load NiaEnv/2019b gcc/8.3.0 tbb/2019u8 boost/1.70.0
module load gcc
module load java
module load trinityrnaseq
module load bowtie2
module load jellyfish
module load salmon/0.14.2 
module load samtools

module load python/3.6
source /scratch/n/nprovart/raywoo32//env/bin/activate

Trinity --seqType fq --SS_lib_type RF --max_memory 225G --min_kmer_cov 1 --CPU 32 --left /scratch/n/nprovart/raywoo32/unzipped/reads-renamed_1.fastq.gz --right /scratch/n/nprovart/raywoo32/unzipped/reads-renamed_2.fastq.gz  --output /scratch/n/nprovart/raywoo32/trinity_output



