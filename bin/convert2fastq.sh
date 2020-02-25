#small files can run more in parallel
find . -name "*ncbi_enc"  -size -5G | parallel -j20 'echo {}; test ! -e {/}_1.fastq.gz && ~/dbGap/sratoolkit.2.3.2-5-ubuntu64/bin/fastq-dump --split-3 --outdir ./ --gzip {}'

find . -name "*ncbi_enc"  -size -20G | parallel -j3 'echo {}; test ! -e {/}_1.fastq.gz && ~/dbGap/sratoolkit.2.3.2-5-ubuntu64/bin/fastq-dump --split-3 --outdir ./ --gzip {}'
