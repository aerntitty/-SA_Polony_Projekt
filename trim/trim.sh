cd SA_polony

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
