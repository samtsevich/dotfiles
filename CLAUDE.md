# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## High-Level Architecture

This repository contains configuration files and scripts for personalizing a Linux/macOS development environment, focusing on shells, terminal emulators, window managers, and command-line tools.

- **Entry Points & Core Shell Configuration**:
    - `~/.profile` (or symlinks to it from `~/.zshrc` or `~/.bashrc`) acts as the primary entry point.
    - `common/apps.sh`: Central script to detect the shell and source configurations, and set up applications.
    - `local.sh`: Optional script for local, machine-specific environment variables and aliases.

- **Shell Management**:
    - **Zsh**: Configured via `common/ohmyzsh.sh` (Oh My Zsh). Includes plugins for various features and integrations.
    - **Bash**: Configured via `common/ohmybash.sh` (Oh My Bash).

- **Application Configuration**:
    - **Git**: `.gitconfig` for core configurations, includes `~/.gitconfig.local` for personal data.
    - **Terminal Emulator**: `config/wezterm.lua` customizes WezTerm.
    - **Shell Prompt**: `config/starship.toml` and `common/starship.sh` configure Starship.
    - **Package Management**: `common/Brewfile.common` and `Brewfile.mac` (from README) for Homebrew.

- **Custom Scripts and Utilities**:
    - `common/aliases.sh`: Common aliases for file operations, disk usage, etc.
    - `common/apps.sh`: Integrates and configures tools like Brew, Cargo, EZA, FZF, GitHub CLI, LazyGit, Nvim, Pyenv, TMUX, UV Python, Yazi, Zoxide.

## Common Development Tasks

This repository does not have traditional build/lint/test commands like a software project. Instead, it focuses on setup, updates, and utility scripts.

### Setup/Installation

- **Install Homebrew packages**:
  ```bash
  brew bundle --file=~/.dotfiles/common/Brewfile.common
  ```
- **Install Zsh plugins (manual)**:
  ```bash
  git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
  git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
  git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search
  ```
- **Symlink shell configuration**:
    - For `zsh`: `ln -s ~/.dotfiles/.profile ~/.zshrc`
    - For `bash`: `ln -s ~/.dotfiles/.profile ~/.bashrc`
- **Symlink config files**:
    - `ln -s ~/.dotfiles/.gitconfig ~/.gitconfig`
    - `ln -s ~/.dotfiles/config/starship.toml ~/.config/starship.toml`

### Update Commands

- **Update all pip packages**: `pipup`
- **Comprehensive system update**: `allup` (updates apt, Oh My Zsh, pyenv, Homebrew, cargo, pip, GitHub CLI extensions, uv)

### Utility Aliases

- `brewdeps`: Shows Homebrew package dependency tree.
- `lg`: Launches `lazygit`.
- `t`, `ta`, `tn`, `tl`: Tmux session management.
- `y`: Launches the Yazi file manager and changes directory on exit.
