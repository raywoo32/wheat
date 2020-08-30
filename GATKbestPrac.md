# GATK Best practises: from FAST to BAM to VCF to 

[WORKFLOW](https://gatk.broadinstitute.org/hc/en-us/articles/360035531192-RNAseq-short-variant-discovery-SNPs-Indels-)

PLEASE NOTE: example jobscripts work, but their files might be degenerated (in scratch) and have ABSOLUTE PATHS. Please modify to your needs. 

1. Allign with STAR 2 pass mode (ref2)

- This is 2 steps and you need to generate genome data first. 
- Also please read the star manual here. [second pass star docs](https://physiology.med.cornell.edu/faculty/skrabanek/lab/angsd/lecture_notes/STARmanual.pdf)

a. Generating the genome. See ./goodJobscripts/starGenomeRename.sh
b. Actual mapping in 2nd pass mode. See ./goodJobscripts/

Notes: 
- Needed to rename trinity generated fasta because names were too long. 
- Make sure that you allocate space (unintuitive) 
- Hyperthreading is better
- Used flag -outSAMunmapped Within to skip step "MergeBamAlignment"

UNLISTED INBETWEEN STEP: 
- Sort and index and turn into a bam file using samtools tutorial [here](http://quinlanlab.org/tutorials/samtools/samtools.html)

2. Data Cleanup with Picard (2 steps)

- Get picard 
```
wget https://github.com/broadinstitute/picard/releases/tag/2.22.8/picard-2.22.8.zip
module load java 
```

a. Skipped MergeBamAlignments with previous step flag
b. [MarkDuplicates](https://gatk.broadinstitute.org/hc/en-us/articles/360042477492-MarkDuplicates-Picard-) ./goodJobscripts/markDuplicates.sh

3. SplitNCigarReads 

- [SplitNCigarReads](https://gatk.broadinstitute.org/hc/en-us/articles/360042478652-SplitNCigarReads)
- ./goodJobscripts/splitNCigarReads.sh     

4. Base Quality Recalibration (3 steps)

These steps all were skipped because we don't have known SNPs to skip. 

5. Variant Calling

- [HaplotypeCaller](https://gatk.broadinstitute.org/hc/en-us/articles/360042913231-HaplotypeCaller)
- ./goodJobscripts/HaplotypeCaller.sh  

Notes: 
- Make sure the new bams are indexed and sorted! I used ./goodJobscripts/SortAndIndex.sh to do so 
- You have to add readGroup labels, since my data didn't have any I added arbitrary read groups with 
AddReadGroups.sh 
- Polyploidy flag needed (6) 

UNLISTED INBETWEEN STEP: 
- Validate the vcf file

6. Variant Filtering

- [VariantFiltration](https://gatk.broadinstitute.org/hc/en-us/articles/360042477652-VariantFiltration)
- Didn't do. I am unsure how filtering works and I would have to do a lot more reading and I think the other lab group can? Please advise. 

