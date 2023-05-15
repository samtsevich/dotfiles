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
* [Neovim](https://neovim.io) + [AstroNvim](https://astronvim.com)

### Prompt
* [Starship](https://starship.rs)


### Additional
Install, pls
* [FZF](https://github.com/junegunn/fzf)


## Installation

### Step 0. Clone

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

