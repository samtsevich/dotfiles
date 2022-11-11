# lsDeluxe
    alias ls='lsd --group-directories-first'
    alias l='ls -l'
    alias la='ls -a'
    alias lla='ls -la'
    alias lt='ls --tree'

# My aliases
    alias cdw='cd ~/Documents/work/_FHI'
    alias cdd='cd ~/Dropbox/_WORK/FHI'
    alias dev='cd ~/Developer'

# confirm before overwriting something
    alias cp="cp -i"
    alias mv='mv -i'
    alias rm='rm -i'

# easier to read disk
    alias df='df -h'     # human-readable sizes
    alias free='free -m' # show sizes in MB

# Connect via SSHFS to remote HPC
    alias connect_raven="sshfs raven:/u/asamt ~/remote_hpc/raven -o cache=no && cd ~/remote_hpc/raven"
    alias umount_raven="cd && sleep 2 && umount ~/remote_hpc/raven"

    alias connect_cuzno="sshfs hpc-cloud-Cu-Zn-Oxide-workstation:/work/home/asamt  ~/remote_hpc/cuzno -o cache=no && cd ~/remote_hpc/cuzno"
    alias umount_cuzno="cd && sleep 2 && umount ~/remote_hpc/cuzno"

# VESTA
    alias vesta="open -a /Applications/VESTA.app/Contents/MacOS/VESTA "

# Nvim
    alias vi="nvim"
    alias vim="nvim"
    alias view="nvim -R"
    alias vimdiff="nvim -d"

