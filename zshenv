export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# skip_global_compinit=1

PATH="/home/${USER}/perl5/bin${PATH:+:${PATH}}"
case ":$PATH:" in
  *:$HOME/bin:*) ;;            # do nothing if $PATH already contains $HOME/bin
  *) PATH=$HOME/bin:$PATH ;;   # in every other case, add it to the front
esac
PATH=$HOME/anaconda/bin:$HOME/.cabal/bin:/usr/local/bin:${PATH}
PATH="/usr/local/sbin:$PATH"
PATH="$HOME/miniconda3/bin:$PATH"
PATH="$PWD/bin:$PATH"
## Clean up duplicates
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++')
export PATH="$PATH"

## configuring libxml2 
## export LDFLAGS="-L/usr/local/opt/libxml2/lib"
## export CPPFLAGS="-I/usr/local/opt/libxml2/include"
## export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"
# export LIBXML_LIBDIR="/usr/local/opt/libxml2/lib"
# export LIBXML_INCDIR="/usr/local/opt/libxml2/include/libxml2/libxml/"
# export LIBXML_INCDIR="/usr/local/opt/libxml2/include"
# echo "$LIBXML_INCDIR"
# ls "$LIBXML_INCDIR"
# Rscript -e 'install.packages("XML")'

export EDITOR=nvim
export SHELL=/bin/zsh
bindkey -M vicmd v edit-command-line
# path=($^path(N))

# export CUDA_HOME=/usr/local/cuda-5.0
# export CUDA_ROOT=/usr/local/cuda/bin
# export LD_LIBRARY_PATH=${CUDA_HOME}/lib64
# export PATH=${CUDA_HOME}/bin:${PATH}

export EVENT_NOKQUEUE=1
export EVENT_NOPOLL=1

AUTOJUMP=/usr/share/autojump/autojump.sh
if [[ -f $AUTOJUMP ]]; then
  source $AUTOJUMP
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
