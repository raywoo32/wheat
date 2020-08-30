#!/bin/bash
#!/bin/bash
#SBATCH --nodes=6
#SBATCH --ntasks-per-node=40
#SBATCH --time=16:00:00
#SBATCH --job-name=starGenome
#SBATCH --output=starGenome_output_%j.txt
#SBATCH --mail-user=woorachels@gmail.com
#SBATCH --mail-type=ALL

cd /scratch/n/nprovart/raywoo32/
module load gcc/7.3.0
module load star 

STAR --runThreadN 6 --runMode genomeGenerate --genomeDir starRename --limitGenomeGenerateRAM 146565785642 --genomeFastaFiles /scratch/n/nprovart/raywoo32/mergeBamData/T1ShortNames.fasta

