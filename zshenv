export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

case ":$PATH:" in
  *:$HOME/bin:*) ;;     # do nothing if $PATH already contains $HOME/bin
  *) PATH=$HOME/bin:$PATH ;;  # in every other case, add it to the front
esac
export PATH=$HOME/current/bin:$HOME/anaconda/bin:$HOME/.cabal/bin:/usr/local/bin:${PATH}
export CDPATH=~/antigenic_space:$CDPATH
export EDITOR=vim
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
