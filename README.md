# Dotfiles

Hi, there! 👋

This Repository Dotfiles contain my personal config files. Here you'll find configs, customizations, themes, and whatever I need to personalize my Linux and mac OS experience.


## Terminal and Application Icons with Nerd-Fonts
To display icons in terminal or applications Fonts, I'm using [Nerd-Fonts](https://www.nerdfonts.com). I'm currently using the **Hack Nerd Font**.

## Prerequested Software

### Terminal
* [iTerm 2](https://iterm2.com)

### Oh My ZSH/BASH
- [Oh My ZSH](https://github.com/ohmyzsh/ohmyzsh)
or
- [Oh My BASH](https://github.com/ohmybash/oh-my-bash)

### TextEditor
* [Neovim](https://neovim.io)
    - [Plugins](https://github.com/LunarVim/Neovim-from-scratch.git)


### Prompt
* [Starship](https://starship.rs)



## Installation

### Step 0. Clone

```
cd
git clone https://github.com/samtsevich/dotfiles ~/.dotfiles
```

### Step 1. Shell

#### Common for all. Must be added either into `~/.zshrc` or `~/.bashrc` file.

```
## Languages
LANG=en_US.utf-8
LC_ALL=en_US.utf-8

[[ -f ~/.dotfiles/aliases.sh ]] && source ~/.dotfiles/aliases.sh
[[ -f ~/.dotfiles/path.sh ]] && source ~/.dotfiles/path.sh
[[ -f ~/.dotfiles/starship.sh ]] && source ~/.dotfiles/starship.sh
[[ -f ~/.dotfiles/local.sh ]] && source ~/.dotfiles/local.sh

```

#### If you use `zsh` then add following lines into `~/.zshrc` file

```
[[ -f ~/.dotfiles/ohmyzsh.sh ]] && source ~/.dotfiles/ohmyzsh.sh
```

#### If you use `bash` then add following lines into `~/.bashrc` file
```
[[ -f ~/.dotfiles/ohmybash.sh ]] && source ~/.dotfiles/ohmybash.sh
```

For the local environmnet of your machine – please, update `~/.dotfiles/local.sh` file. There you can add anything you want.

### Step 2. Config files

- Gitconfig (do not forget to write personal data into `~/.gitconfig.local` file)
- Starship


```
ln -s ~/.dotfiles/.gitconfig  ~/.gitconfig
ln -s ~/.dotfiles/config/starship.toml  ~/.config/starship.toml
```

