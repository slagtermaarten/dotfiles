#!/bin/zsh

freezeOutput() {
  if [ ! -d "output" ]; then
    echo "Output does not exist"
  else
    if [ ! -d "archive" ]; then
      today=`date +%d.%m.%y`
      mv output archive/${today}
    else
      echo "Archive does not exist"
    fi
  fi
}

cleanUpOutput() {
  if [ ! -d "output" ]; then
    mkdir output
  fi
  mv *.(html|htm|md|pdf) output
}
