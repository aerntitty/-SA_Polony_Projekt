#!/bin/bash/nora
echo "doing quality control"
# QC raw
for fq in raw/*_1.fastq.gz; do
  sample=$(basename "$fq" | sed 's/_1.fastq.gz//')
  fastqc raw/${sample}_1.fastq.gz raw/${sample}_2.fastq.gz -o qc/ || true
done


mkdir -p trim
# Trim (paired-end example)
for fq in raw/*_1.fastq.gz; do
  sample=$(basename "$fq" | sed 's/_1.fastq.gz//')
  fastp -i raw/${sample}_1.fastq.gz -I raw/${sample}_2.fastq.gz \
        -o trim/${sample}_1.trim.fastq.gz -O trim/${sample}_2.trim.fastq.gz \
        -h qc/${sample}_fastp.html -j qc/${sample}_fastp.json -w 2
done

mkdir -p assemblies

for fq in trim/*_1.trim.fastq.gz; do
  s=$(basename "$fq" _1.trim.fastq.gz)
  echo "Running SPAdes on $s ..."
  spades.py -1 trim/${s}_1.trim.fastq.gz -2 trim/${s}_2.trim.fastq.gz \
    -o assemblies/${s} --only-assembler -t 2
done
# Run QUAST on your contigs
mkdir quast_report
quast.py assemblies/contigs.fasta -o quast_report/quast_report

