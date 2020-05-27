# GATK Best practises: from FAST to BAM to VCF to 

1. Allign with STAR 2 pass mode (ref2)

[second pass star docs](https://physiology.med.cornell.edu/faculty/skrabanek/lab/angsd/lecture_notes/STARmanual.pdf)
- correct version is Aligned.out.sam
- Does not take a long time to run at all 

2. Data Cleanup with Picard (2 steps)

wget https://github.com/broadinstitute/picard/releases/tag/2.22.8/picard-2.22.8.zip
module load java 

- [MergeBamAlignment](https://gatk.broadinstitute.org/hc/en-us/articles/360037056392-MergeBamAlignment-Picard-)

- [MarkDuplicates](https://gatk.broadinstitute.org/hc/en-us/articles/360042477492-MarkDuplicates-Picard-)


module load NiaEnv/2019b gcc/8.3.0 tbb/2019u8 boost/1.70.0
module load gcc
module load java
module load trinityrnaseq
module load bowtie2
module load jellyfish
module load salmon
module load samtools
gatk/4.1.7.0 and salmon/0.14.2

3. SplitNCigarReads 

- [SplitNCigarReads](https://gatk.broadinstitute.org/hc/en-us/articles/360042478652-SplitNCigarReads)

4. Base Quality Recalibration (3 steps)

- [BaseRecalibrator](https://gatk.broadinstitute.org/hc/en-us/articles/360042477672-BaseRecalibrator)
- [Apply Recalibration](https://gatk.broadinstitute.org/hc/en-us/articles/360042476852-ApplyBQSR) 
- [AnalyzeCovariates](https://gatk.broadinstitute.org/hc/en-us/articles/360042911971-AnalyzeCovariates)

5. Variant Calling

- [HaplotypeCaller](https://gatk.broadinstitute.org/hc/en-us/articles/360042913231-HaplotypeCaller)

6. Variant Filtering

- [VariantFiltration](https://gatk.broadinstitute.org/hc/en-us/articles/360042477652-VariantFiltration)
- NOTE: hard filtering reccomended! 

### References:
1. [GATK best practises for RNAseq prep](https://gatk.broadinstitute.org/hc/en-us/articles/360035531192-RNAseq-short-variant-discovery-SNPs-Indels-)
2. [2 pass mode](https://code.google.com/archive/p/rna-star/issues/7)
