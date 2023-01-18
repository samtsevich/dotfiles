#########
## Common aliases for all systems
#########

# confirm before overwriting something
  alias cp="cp -i"
  alias mv='mv -i'
  alias rm='rm -i'


# Taken from
# https://gist.github.com/ozancaglayan/61fdf417cefd4a5ea4331e0cba4418c5

# SINFO aliases
# Detailed sinfo
alias si="sinfo -o '%8P %10n %.11T %.4c %.8z %.6m %12G %10l %10L %10O %20E' -S '-P'"
# sinfo only on GPU partition
alias sig="si -p gpu"
# sinfo only on CPU partition
alias sic="si -p cpu"

# SQUEUE aliases
# Detailed squeue
alias sq="squeue -Su -o '%8i %10u %20j %4t %5D %20R %15b %3C %7m %11l %11L'"
# squeue only on GPU partition
alias sqg="sq -p gpu"
# squeue only on CPU partition
alias sqc="sq -p cpu"
# squeue only your jobs
alias squ="sq -u `id -un`"
# detailed info about particular job with ID
alias checkjob='scontrol show jobid -dd '
###############


alias htopu='htop -u `id -un`'

# easier to read disk
  alias df='df -h'     # human-readable sizes
  alias free='free -m' # show sizes in MB

# HTOP
  alias htopu='htop --user=$USER'
