# [[ $MYSHELL == *"zsh"* ]] && echo "Equal" || echo "Not equal"
MYSHELL=`echo $SHELL`

export PATH="$PATH:$HOME/bin:$HOME/.local/bin"

# Zoxide exclude dirs
export _ZO_EXCLUDE_DIRS="/opt/intel/*:/work/opt/intel/*"

# Zoxide and FZF
if [[ $MYSHELL == *'bash'* ]]; then
    MYSHELL='bash'

    # Shell
    # [[ -f ~/.dotfiles/ohmybash.sh ]] && source ~/.dotfiles/ohmybash.sh
    [[ -f ~/.dotfiles/common/bashit.sh ]] && source ~/.dotfiles/common/bashit.sh

elif [[ $MYSHELL == *'zsh'* ]]; then
    MYSHELL='zsh'

    export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

    # Ohmyzsh
    [[ -f ~/.dotfiles/common/ohmyzsh.sh ]]  && source ~/.dotfiles/common/ohmyzsh.sh

    # Homebrew
    if type brew &>/dev/null
    then
        FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
        autoload -Uz compinit
        compinit
    fi
fi


# FZF
[ -f ~/.fzf.$MYSHELL ] && source ~/.fzf.$MYSHELL

# Zoxide
eval "$(zoxide init --cmd cd $MYSHELL)"

# Starship
[[ -f ~/.dotfiles/common/starship.sh ]] && source ~/.dotfiles/common/starship.sh

# Cargo
if [[ -d $HOME/.cargo ]]; then
  source $HOME/.cargo/env
  # export PATH="$HOME/.cargo/bin:$PATH"
fi


# Pyenv
PYENV_ROOT="$HOME/.pyenv"

if [[ -d $PYENV_ROOT ]]; then
  export PYENV_ROOT=$PYENV_ROOT
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"

  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi
