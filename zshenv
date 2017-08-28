export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# skip_global_compinit=1

case ":$PATH:" in
  *:$HOME/bin:*) ;;     # do nothing if $PATH already contains $HOME/bin
  *) PATH=$HOME/bin:$PATH ;;  # in every other case, add it to the front
esac
export PATH=$HOME/anaconda/bin:$HOME/.cabal/bin:/usr/local/bin:${PATH}
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/antigenic_space/bin:$PATH"
# added by Miniconda3 4.3.21 installer
export PATH="$HOME/miniconda3/bin:$PATH"

export RPARA="m.slagter@paranoid"
export RSTER="m.slagter@steroid"
export RVOID="m.slagter@void"
export RMED="m.slagter@medoid"

## configuring libxml2 
## export LDFLAGS="-L/usr/local/opt/libxml2/lib"
## export CPPFLAGS="-I/usr/local/opt/libxml2/include"
## export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"
# export LIBXML_LIBDIR="/usr/local/opt/libxml2/lib"
#
# export LIBXML_INCDIR="/usr/local/opt/libxml2/include/libxml2/libxml/"
# export LIBXML_INCDIR="/usr/local/opt/libxml2/include"
# echo "$LIBXML_INCDIR"
# ls "$LIBXML_INCDIR"
# Rscript -e 'install.packages("XML")'

# export CDPATH=~/antigenic_space:$CDPATH
export EDITOR=nvim
export SHELL=/bin/zsh
bindkey -M vicmd v edit-command-line
# path=($^path(N))

# export CUDA_HOME=/usr/local/cuda-5.0
# export CUDA_ROOT=/usr/local/cuda/bin
# export LD_LIBRARY_PATH=${CUDA_HOME}/lib64
# export PATH=${CUDA_HOME}/bin:${PATH}
#

export EVENT_NOKQUEUE=1
export EVENT_NOPOLL=1

source /usr/share/autojump/autojump.sh

PATH="/home/m.slagter/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/m.slagter/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/bioperl-live/
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl/modules
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl-compara/modules
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl-io/modules
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl-tools/modules
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl-variation/modules
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl-funcgen/modules
export PERL5LIB
PERL_LOCAL_LIB_ROOT="/home/m.slagter/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/m.slagter/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/m.slagter/perl5"; export PERL_MM_OPT;
