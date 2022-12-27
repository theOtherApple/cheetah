#!/bin/bash
### Input number of threads
threads="${SLURM_CPUS_ON_NODE}" # will be used as the number of threads

### Read file
# File should have a 1 line header containing the location of the output files
# After the header, there should be one sequence per line and tab separated variables for each line.
# Each line after the header should include the line's name, reference genome, forward read, and reverse read in that order and separated by tabs.
# The last line of the arg file must be blank
ARG_FILE=$1
HEADER_LEN=1

### Identify the location of all outputs and intermediates, based on header line of argument file
loc=$(head -n $HEADER_LEN $ARG_FILE)

### Make environment for outputs and intermediates
mkdir -p "${loc}/mem/"
mkdir -p "${loc}/error_log/"
mkdir -p "${loc}/view/"
mkdir -p "${loc}/sort/"
mkdir -p "${loc}/single_coverage/"
mkdir -p "${loc}/genome_size/"
mkdir -p "${loc}/window_coverage/"
mkdir -p "${loc}/window_coverage/10000/"

cat $ARG_FILE | tail -n +2 | while IFS=$'\t' read -r name reference forward reverse
do
  bash /scratch/general/lustre/u1033847/cheetah/cheetah_once_10.sh ${name} ${reference} ${forward} ${reverse} ${loc} ${threads}
done