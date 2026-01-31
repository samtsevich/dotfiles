# Dotfiles

Hi, there! 👋

This Repository Dotfiles contain my personal config files. Here you'll find configs, customizations, themes, and whatever I need to personalize my Linux and mac OS experience.


## Terminal and Application Icons with Nerd-Fonts
To display icons in terminal or applications Fonts, I'm using [Nerd-Fonts](https://www.nerdfonts.com). I'm currently using the **Hack Nerd Font**.

## Prerequested Software

### Homebrew (for Linux or macOS)
Install [brew.sh](https://brew.sh) 
and install packages for all systems:
```bash
brew bundle --file=~/.dotfiles/common/Brewfile.common
```

For macOS-specific packages:
```bash
brew bundle --file=~/.dotfiles/common/Brewfile.mac
```

Or install the following by hand

#### Terminal
* [iTerm 2](https://iterm2.com)
* [WezTerm](https://wezfurlong.org/wezterm/)

#### Oh My ZSH/BASH
- [Oh My ZSH](https://github.com/ohmyzsh/ohmyzsh)
or
- [Oh My BASH](https://github.com/ohmybash/oh-my-bash)

#### TextEditor
* [Neovim](https://neovim.io) + [AstroNvim](https://astronvim.com)

#### Prompt
* [Starship](https://starship.rs)


#### Additional Tools
* [FZF](https://github.com/junegunn/fzf) - Fuzzy finder
* [eza](https://github.com/eza-community/eza) - Modern replacement for ls
* [Zoxide](https://github.com/ajeetdsouza/zoxide) - Smart cd replacement
* [bat](https://github.com/sharkdp/bat) - Cat clone with syntax highlighting
* [fd](https://github.com/sharkdp/fd) - Simple, fast alternative to find
* [ripgrep](https://github.com/BurntSushi/ripgrep) - Fast search tool
* [GitHub CLI (gh)](https://cli.github.com) - GitHub command-line tool
* [uv](https://github.com/astral-sh/uv) - Fast Python package manager
* [cargo-update](https://github.com/nabijaczleweli/cargo-update) - For updating cargo packages

#### OMZ Plugins
```bash
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autoupdate
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/history-substring-search
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search
git clone https://github.com/ocodo/ollama_zsh_completion ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/ollama
```


## Installation

### Step 0.1. Clone repository

```bash
git clone https://github.com/samtsevich/dotfiles ~/.dotfiles
```


### Step 1. Shell

**Important:** Backup your existing shell configuration before creating symlinks:

```bash
# For zsh users
cp ~/.zshrc ~/.zshrc.backup

# For bash users
cp ~/.bashrc ~/.bashrc.backup
```

#### If you use `zsh` then do the following:

```bash
ln -s ~/.dotfiles/.profile ~/.zshrc
```

#### If you use `bash` then do the following:
```bash
ln -s ~/.dotfiles/.profile ~/.bashrc
```

### Step 1.1. Local configuration (Optional)

For local environment variables, aliases, or machine-specific settings, you can create optional configuration files:

#### Create `local.sh` for personal settings:
```bash
cp ~/.dotfiles/local.sh.example ~/.dotfiles/local.sh
# Edit local.sh with your personal aliases, paths, etc.
```

#### Create `api_keys.sh` for API keys and secrets:
```bash
cp ~/.dotfiles/api_keys.sh.example ~/.dotfiles/api_keys.sh
# Add your API keys (OpenAI, Anthropic, GitHub, AWS, etc.)
```

**Note:** These files are in `.gitignore` and won't be committed to version control.


### Step 2. Config files

- Gitconfig (do not forget to write personal data into `~/.gitconfig.local` file)
- Starship prompt
- WezTerm (optional)

```bash
ln -s ~/.dotfiles/.gitconfig  ~/.gitconfig
ln -s ~/.dotfiles/config/starship.toml  ~/.config/starship.toml
ln -s ~/.dotfiles/config/wezterm.lua  ~/.wezterm.lua
```

