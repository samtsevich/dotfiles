##################
###### PATHS #####
##################

# Pyenv
PYENV_ROOT="$HOME/.pyenv"

if [[ -d $PYENV_ROOT ]]; then
  export PYENV_ROOT=$PYENV_ROOT
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"

  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi

##################
###### LIBS ######
##################


