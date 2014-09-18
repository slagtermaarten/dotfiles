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
  files=`ls *.(html|htm|md|pdf)`
  echo "Move ${files}?"
  read -rs -k 1 ans
  if [[ "${ans}" = "y" ]]; then
    echo "Moving to output..."
    [[ ! -d "output" ]] && mkdir output
    mv ${files} "output"
  else
    echo "Keeping ${files} where they are"
  fi
}
