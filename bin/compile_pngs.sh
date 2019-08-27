#!/bin/zsh
#
# Maarten Slagter 2019-08-27
#
# Compile multiple PNGs into one PDF, one page per image, 
# and annotate each page with the filename of the corresponding PNG
#
OUTPUTFILE=$1
shift

ANNOTATED_FIGS=()

for f in $@; do
  annotation=${f:r:s/_COMP//:s/pipeline_param_titration_grid\-//}
  output_f=${annotation}.wm.png
  echo "Annotating ${f:t} -> ${output_f:t}\n"
  convert -colorspace RGB -density 400 "$f" -fill black -undercolor white \
    -pointsize 10 -gravity south -annotate +0+5 "$annotation" \
    -background white $output_f
  ANNOTATED_FIGS+=($output_f)
done

echo "Combining annotated files into $output_f\n"

convert $ANNOTATED_FIGS $OUTPUTFILE

for f in $ANNOTATED_FIGS[@]; do
  rm -f $f
done
