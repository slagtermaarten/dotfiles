FLAGS='–copy-dirlinks -avh --exclude=".git/"'

syncto ()
{
  if [ "$1" != "" ]
  then
    server=$1
  else
    server='steroid'
  fi
  if [ "$2" != "" ]
  then
    source=$2
  else
    source=~/Dropbox/Immunology/TIL_ODE/TILfitting
  fi
  if [ "$3" != "" ]
  then
    target=$3
  else
    target='TILfitting'
  fi

  rsync -avh ${source} m.slagter@${server}:/home/NKI/m.slagter/${target}
}

syncfrom ()
{
  rsync -avh m.slagter@${1}:/home/NKI/m.slagter/${2} /home/maarten/${2}
}
