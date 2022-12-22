# Dotfiles

Hi, there! 👋

This Repository Dotfiles contain my personal config files. Here you'll find configs, customizations, themes, and whatever I need to personalize my Linux and mac OS experience.


## Terminal and Application Icons with Nerd-Fonts
To display icons in terminal or applications Fonts, I'm using [Nerd-Fonts](https://www.nerdfonts.com). I'm currently using the **Hack Nerd Font**.

## Prerequested Software

### Terminal
* [iTerm 2](https://iterm2.com)
or
* [Warp](https://www.warp.dev)

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

### Step 1. Shell

If you use `zsh` then add following lines into `~/.zshrc` file
```
## Languages
LANG=en_US.utf-8
LC_ALL=en_US.utf-8

[[ -f ~/.dotfiles/aliases.sh ]] && source ~/.dotfiles/aliases.sh
[[ -f ~/.dotfiles/oh-my-zsh.sh ]] && source ~/.dotfiles/oh-my-zsh.sh
[[ -f ~/.dotfiles/path.sh ]] && source ~/.dotfiles/path.sh
[[ -f ~/.dotfiles/starship.sh ]] && source ~/.dotfiles/starship.sh

```

If you use `bash` then add following lines into `~/.bashrc` file

```
## Languages
LANG=en_US.utf-8
LC_ALL=en_US.utf-8

[[ -f ~/.dotfiles/aliases.sh ]] && source ~/.dotfiles/aliases.sh
[[ -f ~/.dotfiles/ohmybash.sh ]] && source ~/.dotfiles/ohmybash.sh
[[ -f ~/.dotfiles/starship.sh ]] && source ~/.dotfiles/starship.sh
```

### Step 2. Gitconfig

Making alias to the `~/.gitconfig` file

```
ls -s ~/.dotfiles/.gitconfig  ~/.gitconfig
```


### Step 3. Starship

Making alias to the `~/.config/starship.toml` file

```
ls -s ~/.dotfiles/config/starship.toml  ~/.config/starship.toml
```



