case ":$PATH:" in
  *:$HOME/bin:*) ;;     # do nothing if $PATH already contains $HOME/bin
  *) PATH=$HOME/bin:$PATH ;;  # in every other case, add it to the front
esac
export PATH=$HOME/.cabal/bin:/usr/local/bin:${PATH}
export EDITOR=vim
export SHELL=/usr/bin/zsh
bindkey -M vicmd v edit-command-line
# path=($^path(N))

# export CUDA_HOME=/usr/local/cuda-5.0
# export CUDA_ROOT=/usr/local/cuda/bin
# export LD_LIBRARY_PATH=${CUDA_HOME}/lib64
# export PATH=${CUDA_HOME}/bin:${PATH}
