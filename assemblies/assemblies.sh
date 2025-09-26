mkdir -p assemblies

while read s; do
  echo "Assembling $s"
  spades.py -1 trim/${s}_1.trim.fastq.gz -2 trim/${s}_2.trim.fastq.gz \
            -o assemblies/${s} --only-assembler -t 2
done < samples.all.txt
