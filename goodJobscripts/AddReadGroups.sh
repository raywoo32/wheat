#!/bin/bash
#!/bin/bash
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=40
#SBATCH --time=11:59:00
#SBATCH --job-name=AddOrReplaceReadGroups
#SBATCH --output=AddOrReplaceReadGroups_output_%j.txt
#SBATCH --mail-user=woorachels@gmail.com
#SBATCH --mail-type=ALL


module load NiaEnv/2019b
module load java
module load gcc
module load python
module load gatk/4.1.7.0
cd /scratch/n/nprovart/raywoo32/AddOrReplaceReadGroups

java -jar  /scratch/n/nprovart/raywoo32/software/Picard/picard.jar  AddOrReplaceReadGroups \
I=/scratch/n/nprovart/raywoo32/splitCigar/splitNCigar.bam \
O=AddedReadGroups.bam \
RGLB=lib1 \
RGPL=illumina \
RGPU=unit1 \
RGSM=Arbitrary


