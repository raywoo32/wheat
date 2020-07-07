# Getting Clean data and Bam file usage

### Mapping was wrong on star, retry

```bash
EXITING because of FATAL ERROR: Read1 and Read2 are not consistent, reached the end of the one before the other one
SOLUTION: Check you your input files: they may be corrupted
```

#### Mutant on scinet 
```bash
raywoo32@nia-login02:~/Data$ zcat 104_RNA_R1.fastq.gz | echo $((`wc -l`/4))
162354528

raywoo32@nia-login02:~/Data$zcat 104_RNA_R2.fastq.gz | echo $((`wc -l`/4))
gzip: 104_RNA_R2.fastq.gz: invalid compressed data--crc error
84713262
```

#### Mutant on Bar - transfer error?
```bash
rwoo@bar:/DATA/Eddi/Wheat$ zcat 104_RNA_R2.fastq.gz | echo $((`wc -l`/4))
gzip: 104_RNA_R2.fastq.gz: invalid compressed data--crc error
84713262
```
- Wrong read number (diff from paired and invalid data) 

#### Validate WT
```bash
raywoo32@nia-login02:~/Data$ zcat WT_RNA_R1.fastq.gz | echo $((`wc -l`/4))
109500303
rwoo@bar:/DATA/Eddi/Wheat$ zcat WT_RNA_R2.fastq.gz | echo $((`wc -l`/4))
109500303
```

### Downloading fastqc to validate 

installation 
```
wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip 
unzip 
./fastqc
No X11 DISPLAY variable was set, but this program performed an operation which r                                                                             equires it.
```
(fix display solution putty)[https://blogs.oracle.com/r/howto:-x11-forwarding-for-oracle-r-enterprise]

running fastqc
```
cd FastQC
module load java
./fastqc /home/n/nprovart/raywoo32/Data/104_RNA_R1.fastq.gz /home/n/nprovart/raywoo32/Data/104_RNA_R2.fastq.gz 
```
### Got new original file 
cat 104_RNA_R2.fastq | echo $((`wc -l`/4))
162354528
- matches other file! 162354528 :) 
- TODO: continue with STAR



#Prepping Bam File:

### Prep environment (niagara scinet)

module load gcc/7.3.0
module load samtools

### Following tutorial
1. Convert to bam
samtools view -S -b aligned.out.sam  > sample.bam

2. View unsorted 
samtools view sample.bam | head

3. Sort 
samtools sort sample.bam -o sample.sorted.bam
samtools view sample.sorted.bam | head

4. Index
samtools index sample.sorted.bam
ls

##### Notes:
unsure about how to check if "properly paired"

#### Unmapped Reads:
```
samtools view -f 4 yourbamfile.bam
```

## Mergebam allignments

[Error 1](http://seqanswers.com/forums/showthread.php?t=9421) 
TODO: 
- make dict
- change .fasta to .fa
- remake star with new reference

```
#!/bin/bash
#!/bin/bash
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=40
#SBATCH --time=0:30:00
#SBATCH --job-name=mergebam
#SBATCH --output=star_output_%j.txt
#SBATCH --mail-user=woorachels@gmail.com
#SBATCH --mail-type=ALL

cd /scratch/n/nprovart/raywoo32
module load java
module load gcc
java -jar /scratch/n/nprovart/raywoo32/software/Picard/picard.jar MergeBamAlignment ALIGNED=/scratch/n/nprovart/raywoo32/Aligned.out.sam  UNMAPPED=/scratch/n/nprovart/raywoo32/unmapped.bam O=./merge_alignments.bam  R=/home/n/nprovart/raywoo32/Data/Assembled_Transcripts_Wheat_WT.fasta  
```

cat Assembled_Transcripts_Wheat_WT.fasta | sed 's/>TRINITY_/>/g' | 's/len=.//g'

## References 
1. [general reading](https://www.researchgate.net/post/Is_it_possible_to_generate_vcf_files_from_FASTQ_files_of_an_RNA-Seq_run)
2. [samtools tutorial](http://quinlanlab.org/tutorials/samtools/samtools.html)
3. [GATK best practises PREPROCESSING for RNAseq data](https://gatk.broadinstitute.org/hc/en-us/articles/360035531192-RNAseq-short-variant-discovery-SNPs-Indels-)

