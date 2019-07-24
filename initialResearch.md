# Initial 

(4h reading) 

I am not sure if Eddi shared the wheat RNA-seq data with you...will you be able to try analyzing it in the BYOD part of the course? Regardless, the idea is to use the WT and mutant samples to identify SNPs in the mutant maybe using this kind of strategy:

1. de novo assemble transcripts from WT using Trinity
2. map with mutant reads to the de novo assembled transcripts and then do variant calling with something like GATK.

Here's some info from our collaborator:

Library prep was done using the NEBNExt poly(A) mRNA protocol - sequenced in 1 lane, high throughput flowcell, 2x126-bases.  Done at SickKids HiSeq2500 I believe.  I am a BBDuk and Trimmomatic adaptor guy - they do this automatically from what I remember and so I don’t recall off hand adaptor sequence.

The wheat cultivar is called AC Taber.

## INITIAL READING 

[HiSeq2500](https://www.illumina.com/systems/sequencing-platforms/hiseq-2500/specifications.html)

[Trinity basics](https://biohpc.cornell.edu/lab/doc/Trinity_workshop_Part1.pdf)

[hiseq2](https://www.illumina.com/documents/products/datasheets/datasheet_hiseq2500.pdf)

[price/type list] (http://www.tcag.ca/documents/facilities/TCAG-NGS-Price-List.pdf)

[illumina](https://www.illumina.com/systems/sequencing-platforms/hiseq-2500/specifications.html)

[protocol](https://international.neb.com/protocols/2014/12/01/protocol-for-use-with-nebnext-poly-a-mrna-magnetic-isolation-module-neb-e7490)