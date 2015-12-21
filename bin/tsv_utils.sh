alias awkt='awk -F"\t"'

header() {
  head -n1 "$@" | tr "\t", "\n" | awk '{print NR, $0}'
}

factorlevels() {
  awk -F"\t" '{a[$2]++;} END {for (k in a) print k, a[k]};' $1
}

tabcol() {
  column -ts "$(printf '\t')"
}

inspect() {
  tabcol $1 | less -S
}

extractline() {
  awk -v ln=$2 'NR == ln {print $0; exit}' $1
}
