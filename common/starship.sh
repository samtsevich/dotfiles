## Stollen from here
## https://github.com/ChristianLempa/dotfiles/blob/main/.zsh/starship.zsh
## and then adapted to my purposes

# find out which distribution we are running on
LFILE="/etc/os-release"
MFILE="/System/Library/CoreServices/SystemVersion.plist"
# if ls $LFILE 1> /dev/null 2>&1; then
if [[ -f $LFILE ]]; then
  _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')

  _device=$(hostnamectl | grep 'Chassis' | awk '/Chassis/ {print $2}')
  case $_device in
    *vm*)     DEVICE="󰇄";;
    *server*) DEVICE="󰒋";;
    *)        DEVICE="";;
  esac

elif [[ -f $MFILE ]]; then
  _distro="macos"
  DEVICE=""
fi

# set an icon based on the distro
# make sure your font is compatible with https://github.com/lukas-w/font-logos
case $_distro in
    *kali*)                          ICON="ﴣ";;
    *arch*)                          ICON="";;
    *debian*)                        ICON="";;
    *raspbian*)                      ICON="";;
    *ubuntu*)                        ICON="";;
    *elementary*)                    ICON="";;
    *fedora*)                        ICON="";;
    *coreos*)                        ICON="";;
    *gentoo*)                        ICON="";;
    *mageia*)                        ICON="";;
    *centos*)                        ICON="";;
    *opensuse*|*sles*|*tumbleweed*)  ICON="";;
    *sabayon*)                       ICON="";;
    *slackware*)                     ICON="";;
    *linuxmint*)                     ICON="";;
    *alpine*)                        ICON="";;
    *aosc*)                          ICON="";;
    *nixos*)                         ICON="";;
    *devuan*)                        ICON="";;
    *manjaro*)                       ICON="";;
    *rhel*)                          ICON="";;
    *macos*)                         ICON="";;
    *)                               ICON="";;
esac

export STARSHIP_DISTRO="$ICON"
export STARSHIP_DEVICE="$DEVICE"

# Starship
eval "$(starship init $SHELL)"

