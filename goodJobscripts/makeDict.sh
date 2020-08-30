#!/bin/bash
#!/bin/bash
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=40
#SBATCH --time=3:00:00
#SBATCH --job-name=dict
#SBATCH --output=dict_output_%j.txt
#SBATCH --mail-user=woorachels@gmail.com
#SBATCH --mail-type=ALL

cd /scratch/n/nprovart/raywoo32
module load java
module load gcc
java -jar /scratch/n/nprovart/raywoo32/software/Picard/picard.jar CreateSequenceDictionary R=T1ShortNames.fasta  O=reference.dict


