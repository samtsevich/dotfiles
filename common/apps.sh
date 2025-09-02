MY_SHELL=`echo $SHELL`

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:" ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi
if ! [[ "$PATH" =~ "$HOME/bin:" ]]; then
    PATH="$HOME/bin:$PATH"
fi

# Set XDG_CACHE_HOME if not already set
if [ -z "$XDG_CACHE_HOME" ]; then
  export XDG_CACHE_HOME="$HOME/.cache"
fi

# Create XDG_CACHE_HOME directory if it doesn't exist
if [ ! -d "$XDG_CACHE_HOME" ]; then
  mkdir -p "$XDG_CACHE_HOME"
fi

# Set XDG_CONFIG_HOME if not already set
if [ -z "$XDG_CONFIG_HOME" ]; then
  export XDG_CONFIG_HOME="$HOME/.config"
fi

# Create XDG_CONFIG_HOME directory if it doesn't exist
if [ ! -d "$XDG_CONFIG_HOME" ]; then
  mkdir -p "$XDG_CONFIG_HOME"
fi

# ==========
# 1. Prompts
# ==========

  if [[ $MY_SHELL == *'bash'* ]]; then
    MY_SHELL='bash'
    # [[ -f ~/.dotfiles/ohmybash.sh ]] && source ~/.dotfiles/ohmybash.sh
    [[ -f ~/.dotfiles/common/bashit.sh ]] && source ~/.dotfiles/common/bashit.sh
  elif [[ $MY_SHELL == *'zsh'* ]]; then
    MY_SHELL='zsh'
    export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
    export ZCOMPDUMP=$ZSH/cache/.zcompdump-$HOST
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

    # Bash
    if [[ $MY_SHELL == *'bash'* ]]; then
      if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
        source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
      else
        for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
          [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
        done
      fi

    # Zsh
    elif [[ $MY_SHELL == *'zsh'* ]]; then
      FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
      autoload -Uz compinit
      compinit -d $ZSH_COMPDUMP
    fi

    # Setting python
    MAYBE_PYTHON_PATH="$(brew --prefix python@3.12)/libexec/bin"
    if [[ -d $MAYBE_PYTHON_PATH ]]; then
      export PATH="$MAYBE_PYTHON_PATH:$PATH"
    fi

    # Setting alias to build tree of dependencies
    alias brewdeps="brew leaves | xargs brew deps --include-build --tree"
  fi

# Cargo
  if [[ -d $HOME/.cargo ]]; then
    source $HOME/.cargo/env
  fi

# EZA
  if type eza &>/dev/null; then
    alias ls="eza --icons=always --group-directories-first"
  fi

# FZF
  eval "$(fzf --$MY_SHELL)"
  # --- setup fzf theme ---

  fg="#CBE0F0"
  bg="#011628"
  bg_highlight="#143652"
  purple="#B388FF"
  blue="#06BCE4"
  cyan="#2CF9ED"

  export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

  # -- Use fd instead of fzf --

  export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

  show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

  export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
  export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

  # Advanced customization of fzf options via _fzf_comprun function
  # - The first argument to the function is the name of the command.
  # - You should make sure to pass the rest of the arguments to fzf.
  _fzf_comprun() {
    local command=$1
    shift

    case "$command" in
      cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
      export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
      # ssh)          fzf --preview 'dig {}'                   "$@" ;;
      *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
    esac
  }


# Github Copilot
  if type gh &>/dev/null; then
    eval "$(gh copilot alias -- $MY_SHELL)"
    alias ghcup="gh extension upgrade --all"
  fi

# LazyGit
  alias lg='lazygit'

# lsDeluxe
  # alias ls='lsd --group-directories-first'
  alias l='ls -l'
  alias la='ls -a'
  alias lla='ls -la'
  alias lt='ls --tree --level 2'

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

# Speedtest-cli
  if type speedtest-cli &>/dev/null; then
    alias stc='speedtest-cli'
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

# UV python
  if type uv &>/dev/null; then
    eval "$(uv generate-shell-completion $MY_SHELL)"
  fi

# Yazi
  function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
  }


# Zoxide
  eval "$(zoxide init --cmd cd $MY_SHELL)"
  export _ZO_EXCLUDE_DIRS="/opt/intel/*:/work/opt/intel/*"


# ==========
# 3. Updating Apps and packages
# ==========

# pip
  update_all_pip_packages() {
    OUTDATED_PACKAGES=`echo $(pip list --outdated | sed -e '1,2d' | awk '{printf $1" "}')`
    # echo $OUTDATED_PACKAGES

    if [[ $OUTDATED_PACKAGES ]]; then
      pip list --outdated | sed -e '1,2d' | awk '{printf $1" "}' | xargs -n1 pip install --upgrade
    fi
  }
  alias pipup="update_all_pip_packages"



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

    if type uv &>/dev/null; then
      uv self update
    fi
  }

  alias allup="update_all_packages"
