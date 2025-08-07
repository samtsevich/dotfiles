# Dotfiles

Hi, there! 👋

This Repository Dotfiles contain my personal config files. Here you'll find configs, customizations, themes, and whatever I need to personalize my Linux and mac OS experience.


## Terminal and Application Icons with Nerd-Fonts
To display icons in terminal or applications Fonts, I'm using [Nerd-Fonts](https://www.nerdfonts.com). I'm currently using the **Hack Nerd Font**.

## Prerequested Software

### Homebrew (for Linux or macOS)
Install [brew.sh](https://brew.sh) 
and install packages for all kind of system
```
brew bundle --file=~/.dotfiles/common/Brewfile.common
```

Or install the following by hands

#### Terminal
* [iTerm 2](https://iterm2.com)

#### Oh My ZSH/BASH
- [Oh My ZSH](https://github.com/ohmyzsh/ohmyzsh)
or
- [Oh My BASH](https://github.com/ohmybash/oh-my-bash)

#### TextEditor
* [Neovim](https://neovim.io) + [AstroNvim](https://astronvim.com)

#### Prompt
* [Starship](https://starship.rs)


#### Additional
Install, pls
* [FZF](https://github.com/junegunn/fzf)
* OMZ Plugins
```bash
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
* [Lsd](https://github.com/lsd-rs/lsd)
* 


## Installation

### Step 0.1. Clone repository

```bash
git clone https://github.com/samtsevich/dotfiles ~/.dotfiles
```


### Step 1. Shell

<!-- #### Common for all. Must be added either into `~/.zshrc` or `~/.bashrc` file. -->

#### If you use `zsh` then do the following:

```bash
ln -s ~/.dotfiles/.profile ~/.zshrc
```

#### If you use `bash` then do the following:
```bash
ln -s ~/.dotfiles/.profile ~/.bashrc
```

For the local environment variables or exports – please, update `~/.dotfiles/local.sh` file. There you can add anything you want.


### Step 2. Config files

- Gitconfig (do not forget to write personal data into `~/.gitconfig.local` file)
- Starship

```
ln -s ~/.dotfiles/.gitconfig  ~/.gitconfig
ln -s ~/.dotfiles/config/starship.toml  ~/.config/starship.toml
```

