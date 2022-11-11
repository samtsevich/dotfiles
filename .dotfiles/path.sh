##################
###### PATHS #####
##################
# export PATH="/opt/homebrew/sbin:/opt/homebrew/bin:$PATH"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"



##################
###### LIBS ######
##################

export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/fftw/3.3.10_1/lib:$DYLD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$DYLD_LIBRARY_PATH"

