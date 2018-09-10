export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# skip_global_compinit=1

## Prevent double entries in $PATH, I tend to get rather obsessive about these
## things
pathagg () {
  if [[ -d $1 ]]; then
		if ! echo $PATH | egrep -q "(^|:)$1($|:)"; then
			 if [[ "$2" == "after" ]]; then
					PATH=$PATH:$1
			 else
					PATH=$1:$PATH
			 fi
		fi
    if [[ "$2" == "prepend" ]]; then
      ## TODO properly erase previous entry if that existed
      # PATH="${PATH//:$1://}"
      # PATH="${PATH//$1://}"
      # PATH="${PATH//:$1//}"
      ## Clear out previous entry and put to the front
      # PATH="$( echo $PATH | tr : '\n' | grep -v $1 | paste -s -d: )"
      PATH=$1:$PATH
    fi
	fi
}

pathagg $HOME/bin
pathagg $PWD/bin
## I always want access to FAS bin, will probably leave path as soon as this
## behemoth is finished
pathagg $HOME/antigenic_space/bin
pathagg /usr/local/bin prepend
pathagg $HOME/perl5/bin after
pathagg $HOME/anaconda/bin after
pathagg $HOME/.cabal/bin after
pathagg $HOME/miniconda3/bin after
pathagg $HOME/miniconda2/bin after

JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home/jre
pathagg $JAVA_HOME/bin

if [[ $(uname) == 'Darwin' ]]; then
	pathagg $HOME/anaconda/envs/r34/bin
fi
# Deduplicate path variables
get_var () {
    eval 'printf "%s\n" "${'"$1"'}"'
}
set_var () {
    eval "$1=\"\$2\""
}
dedup_pathvar () {
    pathvar_name="$1"
    pathvar_value="$(get_var "$pathvar_name")"
    deduped_path="$(perl -e 'print join(":",grep { not $seen{$_}++ } split(/:/, $ARGV[0]))' "$pathvar_value")"
    set_var "$pathvar_name" "$deduped_path"
}
dedup_pathvar PATH
export PATH
# echo "Path: $PATH"

## configuring libxml2 
# export LDFLAGS="-L/usr/local/opt/libxml2/lib"
# export CPPFLAGS="-I/usr/local/opt/libxml2/include"
# export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"
# export LIBXML_LIBDIR="/usr/local/opt/libxml2/lib"
# export LIBXML_INCDIR="/usr/local/opt/libxml2/include/libxml2/libxml/"
# export LIBXML_INCDIR="/usr/local/opt/libxml2/include"
# echo "$LIBXML_INCDIR"
# ls "$LIBXML_INCDIR"
# Rscript -e 'install.packages("XML")'

export EDITOR=vim
export SHELL=/bin/zsh
bindkey -M vicmd v edit-command-line
# path=($^path(N))

# export CUDA_HOME=/usr/local/cuda-5.0
# export CUDA_ROOT=/usr/local/cuda/bin
# export LD_LIBRARY_PATH=${CUDA_HOME}/lib64
# export PATH=${CUDA_HOME}/bin:${PATH}

export EVENT_NOKQUEUE=1
export EVENT_NOPOLL=1


if [[ "0" ]]; then
  if [[ $(uname) = "Darwin" ]]; then
    AUTOJUMP=/usr/local/etc/profile.d/autojump.sh
    [ -f $AUTOJUMP ] && source $AUTOJUMP
  fi
elif [[ $(uname) = "Linux" ]]; then
  AUTOJUMP=/usr/share/autojump/autojump.sh
  [ -f $AUTOJUMP ] && source $AUTOJUMP
fi

PERL5LIB="/home/${USER}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/bioperl-live/
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl/modules
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl-compara/modules
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl-io/modules
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl-tools/modules
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl-variation/modules
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl-funcgen/modules
PERL_LOCAL_LIB_ROOT="/home/${USER}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
PERL_MB_OPT="--install_base \"/home/${USER}/perl5\""
PERL_MM_OPT="INSTALL_BASE=/home/${USER}/perl5"
export PERL5LIB
export PERL_LOCAL_LIB_ROOT
export PERL_MB_OPT
export PERL_MM_OPT
