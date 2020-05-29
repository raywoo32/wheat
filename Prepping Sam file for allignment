### Read num
raywoo32@nia-login02:~/Data$ zcat 104_RNA_R1.fastq.gz | echo $((`wc -l`/4))
162354528

zcat 104_RNA_R2.fastq.gz | echo $((`wc -l`/4))
gzip: 104_RNA_R2.fastq.gz: invalid compressed data--crc error
84713262

raywoo32@nia-login02:~/Data$ zcat WT_RNA_R1.fastq.gz | echo $((`wc -l`/4))
109500303

zcat 104_RNA_R2.fastq.gz | echo $((`wc -l`/4))
gzip: 104_RNA_R2.fastq.gz: invalid compressed data--crc error
84713262


rwoo@bar:/DATA/Eddi/Wheat$ zcat WT_RNA_R2.fastq.gz | echo $((`wc -l`/4))
109500303


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

## References 
1. [general reading](https://www.researchgate.net/post/Is_it_possible_to_generate_vcf_files_from_FASTQ_files_of_an_RNA-Seq_run)
2. [samtools tutorial](http://quinlanlab.org/tutorials/samtools/samtools.html)
3. [GATK best practises PREPROCESSING for RNAseq data](https://gatk.broadinstitute.org/hc/en-us/articles/360035531192-RNAseq-short-variant-discovery-SNPs-Indels-)
