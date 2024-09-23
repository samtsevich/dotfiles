MYSHELL=`echo $SHELL`

export PATH="$PATH:$HOME/bin:$HOME/.local/bin"

# ==========
# 1. Prompts
# ==========

  if [[ $MYSHELL == *'bash'* ]]; then
    MYSHELL='bash'
    # [[ -f ~/.dotfiles/ohmybash.sh ]] && source ~/.dotfiles/ohmybash.sh
    [[ -f ~/.dotfiles/common/bashit.sh ]] && source ~/.dotfiles/common/bashit.sh
  elif [[ $MYSHELL == *'zsh'* ]]; then
    MYSHELL='zsh'
    export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
    [[ -f ~/.dotfiles/common/ohmyzsh.sh ]]  && source ~/.dotfiles/common/ohmyzsh.sh
  fi

# ==========
# 2. Apps // written in alphabetic order
# ==========

# Brew
  if [[ -d /home/linuxbrew/.linuxbrew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi

  if type brew &>/dev/null; then
    if [[ $MYSHELL == *'bash'* ]]; then
      if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
        source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
      else
        for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
          [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
        done
      fi
    elif [[ $MYSHELL == *'zsh'* ]]; then
      FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
      autoload -Uz compinit
      compinit
    fi
  fi

# Cargo
  if [[ -d $HOME/.cargo ]]; then
    source $HOME/.cargo/env
  fi

# FZF
  eval "$(fzf --$MYSHELL)"

# LazyGit
  alias lg='lazygit'

# lsDeluxe
  alias ls='lsd --group-directories-first'
  alias l='ls -l'
  alias la='ls -a'
  alias lla='ls -la'
  alias lt='ls --tree'

# Nvim
  alias vi="nvim"
  alias vim="nvim"
  alias view="nvim -R"
  alias vimdiff="nvim -d"

# Pyenv
  PYENV_ROOT="$HOME/.pyenv"

  if [[ -d $PYENV_ROOT ]]; then
    export PYENV_ROOT=$PYENV_ROOT
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
  fi

# Starship
  STARSHIP_INIT_FILE="$HOME/.dotfiles/common/starship.sh"
  [[ -f $STARSHIP_INIT_FILE ]] && source $STARSHIP_INIT_FILE

# TMUX
  # Attaches tmux to the last session; creates a new session if none exists.
  alias t='tmux attach || tmux new-session'
  # Attaches tmux to a session (example: ta portal)
  alias ta='tmux attach -t'
  # Creates a new session
  alias tn='tmux new-session'
  # Lists all ongoing sessions
  alias tl='tmux list-sessions'

# Zoxide
  eval "$(zoxide init --cmd cd $MYSHELL)"
  export _ZO_EXCLUDE_DIRS="/opt/intel/*:/work/opt/intel/*"



# ==========
# 3. Updating Apps and packages
# ==========

# pip
  alias pipup="pip list --outdated | sed -e '1,2d' | grep -v numpy | awk '{print \$1}' | xargs -n1 pip install --upgrade"

# Github Copilot
  alias ghcup="gh extension upgrade --all"

# UPDATE ALL
  update_all_packages() {
    # Ubuntu / Debian
    if type apt-get &>/dev/null; then
      sudo apt update
      sudo apt upgrade -y
      sudo apt autoremove -y
      sudo apt autoclean -y
    fi

    # Oh my zsh
    if type omz &>/dev/null; then
      omz update
    fi

    # Pyenv
    if type pyenv &>/dev/null; then
      pyenv update
    fi

    # Brew
    if type brew &>/dev/null; then
      brew update
      brew upgrade
      brew cleanup
    fi

    # Cargo
    if type cargo &>/dev/null; then
      cargo install-update -a
    fi

    # Pip
    if type pip &>/dev/null; then
      pipup
    fi

    # Github Copilot (gh) extensions
    if type gh &>/dev/null; then
      ghcup
    fi
  }

  alias allup="update_all_packages"

