# Trinity, Mapping and Variant Calling 

## DATA NOTES

- Main generated file: /scratch/n/nprovart/raywoo32/DATA/HaplotypeCaller
- Best Data: /scratch/n/nprovart/raywoo32/DATA

PLEASE NOTE IT IS IN SCRATCH AND THUS NOT BACKED UP! 

## About

- Library prep was done using the NEBNExt poly(A) mRNA protocol - sequenced in 1 lane, high throughput flowcell, 2x126-bases
- Done at SickKids HiSeq2500
- Wheat cultivar is called AC Taber.

TODO: Use WT and mutant samples to identify SNPs in the mutant maybe using this kind of strategy:

1. de novo assemble transcripts from WT using Trinity
2. map with mutant reads to the de novo assembled transcripts and then do variant calling 

Took place on Scinet's [Niagara](https://docs.scinet.utoronto.ca/index.php/Niagara_Quickstart)
Also see ./Niagara .md

Software Tools Used: 
1. Samtools [samtools tutorial](http://quinlanlab.org/tutorials/samtools/samtools.html)
2. GATK/Picard, Star
3. TrinityRNA seq [github](https://github.com/trinityrnaseq/trinityrnaseq/wiki)
4. Trimmomatic [here](http://www.usadellab.org/cms/?page=trimmomatic)
*** Usage examples in ./goodJobscripts

### Step 1: Trinity RNA seq

a. Trim using Trimmomatic ./goodJobscripts/trimmomaticJobscript.sh 
b. Insilico read normalization 
c. Generating Genome ./trinityJobscript.sh

To Note:
- The working directory for Trinity has to have trinity in the name 

### Step 2: GATK best practises preprocessing for RNAseq Data 

[WORKFLOW](https://gatk.broadinstitute.org/hc/en-us/articles/360035531192-RNAseq-short-variant-discovery-SNPs-Indels-)

For my write-up please see: ./GATKbestPrac.md

#### Contact: 

If you need more info don't hesitate to contact 
Rachel Woo, woorachels@gmail.com
