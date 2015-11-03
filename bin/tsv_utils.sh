alias awkt='awk -F"\t"'

header() {
  head -n1 "$@" | tr "\t", "\n" | awk '{print NR, $0}'
}

factorlevels() {
  awk -F"\t" '{a[$2]++;} END {for (k in a) print k, a[k]};' $1
}

inspect() {
  column -ts "$(printf '\t')" | less -S
}

