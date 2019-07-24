# TRINITY RESEARCH AND INSTALLATION 

## ABOUT RNA-SEQ METHOD 


## RESEARCH 

1. Read [Tutorial](https://github.com/trinityrnaseq/trinityrnaseq/wiki) (39 pages, 1h)
2. Watch Trinity Screencast [Videos](https://www.broadinstitute.org/broade/trinity-screencast) (30 minutes)

## Screencast

### Intro Trinity Overview (V1)
- Problem: reads are shorter than transcripts from which they were derived
- Goal: reconstruct the full length transcripts
- If ref seq, you can allign to ref (with intron recognition), short read allignment, not the reads will reconstruct the answer
- If not ref seq, de novo transcript reconstruction from spliced allignment of assembled allignments 
- Trinity is de novo
- Is open source *increase runtime performace!
- Requires linux ox, 1g of ram per 1m illumina reads 
- *** TRINITY CAN BE RUN AT NO COST HERE: www.diagcomputing.org

#### Aside: about diag
[diag](https://diagcomputing.org/)

- Does it have sufficient:
- power (runtime) 
- software installation, preprocessing ect.

### de Bruijin Graphs (V2)
- TODO: read Jeffrey Martin and Zhong Wang Next-generation Transcriptome assembly
- first step is to construct graph from kmers 
- each kmer is a node is the graph 
- branches for complexity 
- graph is pruned to remove bubbles and stuff from sequencing errors
- Need linear unbranched chains 
- traverse graphs to create possible transcripts, not all paths are good
- transcriptome is not expecting one level of coverage, there are multiple contigs per locus, there are strand specific (could be from either side), sense and antisense separetley 
- trinity builds many small graphs VS 1 which is more common for other assemblers 

### How Trinity Works (V3)
####Inchworm - assembles rna seq data into linear contigs

- overlapping k-mers (default 25), do not save ends
- single most abundant is seed kmer 
- seed kmer is extended guided by coverage of overlapping kmers, 4 possible at anytime ending at each nucleotide. Frequncy is how choice is guided
- When tie, recursivley extend to find optimal
- Continue extension, contig is reported and kmers found are removed from kmer catalog
- Ends when kmer catalog has been depleted 
- (Does not work for alternative splicing) 
- Shared isoforms are not reported (because removed from catalog)
- greedy assembly, alternative splices are reported as separate contigs (the less common ones) 


#### Crysalis - groups contigs related to alternate splicing or gene duplication into de brujn graphs
- At the k-minus 1 overlapps clusters contigs and leverages read pairing info
- Connected constructs de brujin graphs (one per gene) 
- Each graph represents the transcriptional complexity at each point

#### Butterfly - examines reads in context of de brun graphs and reports full transcripts and isoforms 
- Operates on each graph independently
- compacts graph, compact graph with reads, seqeunes isoforms and parlogs
- Tells the most probable paths 
- paralogs can be unknowlingly linked, butterflky can tease apart paralogs 
- can then be checked against reference 

### Using strand specific RNA-seq for Trinity transcriptome assembly (V4)
- strand specific is preffered but not required 
- fewer confounding graph structures, bbiologically seprate sense vs antisense transctiption 
- dUPT second strand marking is leading protocol 
- reads should have a specific orientiation with respect to the sense strand of expressed transcript sequence 
- IS IT SENSE OR ANTISENSE????
- ideal is reverse compliment, NEED TO CHECK THE STRAND SPECIFIC LIBRARY 
- antisense and sense can make different alternate transcripts 
- NOTE: its too late either way 


## Trinity manual
### What is a sufficient machine to run Trinity on?

- [link](https://github.com/trinityrnaseq/trinityrnaseq/wiki/Trinity-Computing-Requirements)
need at least 250GB, can run on second laptop, mac (if too slow look into diag above)
- [galaxy](https://github.com/trinityrnaseq/trinityrnaseq/wiki/Accessing-Trinity-on-Publicly-Available-Compute-Resources)
- [Install Trinity using docker](https://github.com/trinityrnaseq/trinityrnaseq/wiki/Trinity-in-Docker) 

#### Aside, install Docker
[docker](https://docs.docker.com/docker-for-mac/)

###

## installation 2
1. install cmake [here](https://www.google.com/search?client=firefox-b-d&q=install+cmake+command+line+mac#kpvalbx=1)
2. [bioconda](https://anaconda.org/bioconda/trinity)
## CONCLUSION: 