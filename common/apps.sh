MYSHELL=`echo $SHELL`
# [[ $MYSHELL == *"zsh"* ]] && echo "Equal" || echo "Not equal"


# Starship
[[ -f ~/.dotfiles/common/starship.sh ]] && source ~/.dotfiles/common/starship.sh

# FZF
if [[ $MYSHELL == *'bash'* ]]; then
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
elif [[ $MYSHELL == *'zsh'* ]]; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi


# Zoxide
if [[ $MYSHELL == *'bash'* ]]; then
    eval "$(zoxide init bash)"
elif [[ $MYSHELL == *'zsh'* ]]; then
    eval "$(zoxide init zsh)"
fi

