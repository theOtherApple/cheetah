# cheetah
### A genomic pipeline for finding sliding window coverage and coverage at each basepair.

## Getting started
### Dependencies
- python 3 (verified with version 3.10.3) 
- bedtools (verified with version 2.28.0)
- samtools (verified with version 1.16) 
- bwa (verified with version 2020_03_19) 
- fachrlens (as part of the jgbutils by James G. Baldwin-Brown)
  -https://github.com/jgbaldwinbrown/jgbutils/tree/master/Baldwin-Brown_2020_Ccol_genome

### Download and installation

## Usage
### Quick start
The cheetah script runs within the terminal. Simply run the cheetah bash script along with a configuration text file and number of threads to be used as arguments.
>bash cheetah.sh	cheetah_cfg_1.txt 8

The configuration file is composed of 1 header line and 1 line per sample you want to use cheetah on.
The header line contains the path to where you want all intermediate output files to be located. Directories to contain all output files will be automatically created.
>path/where/directories/are/stored/ 8

After the header, there should be one line per sequence to be run of tab separated variables. Each line after the header should include the line's name, reference genome, forward read, and reverse read in that order and separated by tabs.
>iso1	iso1_reference.fasta	iso1_forward.fasta	iso1_reverse.fasta
>a4	a4_reference.fasta	a4_forward.fasta	a4_reverse.fasta

There must be one blank line at the end of the configuration file.

### Further details


## Credits
Pipeline intially developed by Mikal Peterson with assitance of James G. Baldwin-Brown. Special thanks to the Phadnis lab at the University of Utah.
