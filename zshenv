export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

case ":$PATH:" in
  *:$HOME/bin:*) ;;     # do nothing if $PATH already contains $HOME/bin
  *) PATH=$HOME/bin:$PATH ;;  # in every other case, add it to the front
esac
export PATH=$HOME/anaconda/bin:$HOME/.cabal/bin:/usr/local/bin:${PATH}
export PATH="/usr/local/sbin:$PATH"
export CDPATH=~/antigenic_space:$CDPATH
export EDITOR=nvim
export SHELL=/usr/bin/zsh
bindkey -M vicmd v edit-command-line
# path=($^path(N))

# export CUDA_HOME=/usr/local/cuda-5.0
# export CUDA_ROOT=/usr/local/cuda/bin
# export LD_LIBRARY_PATH=${CUDA_HOME}/lib64
# export PATH=${CUDA_HOME}/bin:${PATH}
#
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/bioperl-live/
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl/modules
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl-compara/modules
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl-io/modules
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl-tools/modules
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl-variation/modules
PERL5LIB=${PERL5LIB}:${HOME}/libs/perl/ensembl-funcgen/modules
export PERL5LIB

# PATH="/Users/maartenslagter/perl5/bin${PATH+:}${PATH}"; export PATH;
# PERL5LIB="/Users/maartenslagter/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/Users/maartenslagter/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/Users/maartenslagter/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/Users/maartenslagter/perl5"; export PERL_MM_OPT;
export EVENT_NOKQUEUE=1
export EVENT_NOPOLL=1
