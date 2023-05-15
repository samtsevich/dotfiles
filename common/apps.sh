# [[ $MYSHELL == *"zsh"* ]] && echo "Equal" || echo "Not equal"
MYSHELL=`echo $SHELL`

# Zoxide and FZF
if [[ $MYSHELL == *'bash'* ]]; then

    # Shell
    # [[ -f ~/.dotfiles/ohmybash.sh ]] && source ~/.dotfiles/ohmybash.sh
    [[ -f ~/.dotfiles/bashit.sh ]] && source ~/.dotfiles/bashit.sh

    # FZF
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash

    # Zoxide
    eval "$(zoxide init bash)"
elif [[ $MYSHELL == *'zsh'* ]]; then
    # Ohmyzsh
    [[ -f ~/.dotfiles/common/ohmyzsh.sh ]]  && source ~/.dotfiles/common/ohmyzsh.sh

    # FZF
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

    # Zoxide
    eval "$(zoxide init zsh)"
fi


# Starship
[[ -f ~/.dotfiles/common/starship.sh ]] && source ~/.dotfiles/common/starship.sh
