#!/usr/bin/env Rscript

'create_tx2gene.

Usage:
  create_tx2gene <cdna>
  create_tx2gene <cdna> <output_file>

Options:
  -h --help     Show this screen.
  --version     Show version.
' -> doc

library(docopt)
cla <- docopt(doc, version = 'create_tx2gene v0.1')

if (is.null(cla$output_file)) {
  cla$output_file <- file.path(
    dirname(cla$cdna), 
    gsub('(.*)\\..*$', '\\1.ensg_to_symbol.tsv', basename(cla$cdna)))
}

message(sprintf('Analyzing %s, creating %s', cla$cdna, cla$output_file))
# cdna = '/DATA/resources/ensembl_86/fasta_cdna/Homo_sapiens.GRCh38.cdna.all.fa'

library(maartenutils)

read_command <- ifelse(grepl('\\.gz$', cla$cdna), 'zcat', 'cat')

com <- sprintf("%s %s | awk -F ' ' '$1 ~ />/ { print $1, $3, $4, $7 }'", 
  read_command, cla$cdna)
tx2gene <- suppressMessages(fread(com, header = F))
setnames(tx2gene, c('transcript_id', 'coord', 'gene_id', 'hugo_symbol'))
tx2gene[, transcript_id := gsub('>', '', transcript_id)]
tx2gene[, gene_id := gsub('gene:', '', gene_id)]
tx2gene[, hugo_symbol := gsub('gene_symbol:', '', hugo_symbol)]
tx2gene[, c('chromosome', 'start_position', 'end_position', 'strand') := 
  tstrsplit(coord, ':')[c(3, 4, 5, 6)]]
tx2gene[, coord := NULL]

maartenutils::write_tsv(tx2gene, output_file = cla$output_file)
if (file.exists(cla$output_file) && file.size(cla$output_file) > 1000)
  message(sprintf('Wrote results to %s', cla$output_file))
