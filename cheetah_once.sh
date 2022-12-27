#!/bin/bash

###Read args
name=$1
reference=$2
forward=$3
reverse=$4
loc=$5
threads=$6

####TODO: REMOVE THIS
echo "name"
echo "reference"
echo "forward"
echo "reverse"
echo "loc"
echo "threads"
echo $name
echo $reference
echo $forward
echo $reverse
echo $loc
echo $threads

# BWAmem mapping then SAM to BAM
bwa mem -t ${threads} \
${reference} \
${forward} \
${reverse} \
2> "${loc}/error_log/${name}_bwa.err" | \
samtools view -bS \
> "${loc}/mem/${name}_mapped.bam"

# SAMTools filter
samtools view -bq 30 "${loc}/mem/${name}_mapped.bam" > "${loc}/view/${name}_viewed.bam"

# SAMTools sort
samtools sort "${loc}/view/${name}_viewed.bam" > "${loc}/sort/${name}_sorted.bam"

# bedtools find read coverage with single basepair resolution
bedtools genomecov -bga -split -ibam "${loc}/sort/${name}_sorted.bam" > "${loc}/single_coverage/${name}_coverage.bg"

# generate genome file sizes
if [ "gz" == "${$reference##*.}"  ]; then
        gunzip -c ${reference} | python3 fachrlens.py > "${loc}/genome_size/${name}_size.bam"
else
        python3 fachrlens.py ${reference} > "${loc}/genome_size/${name}_size.bam"
fi
##############TODO: fix name of size file
##############TODO: Add option to do this step only once