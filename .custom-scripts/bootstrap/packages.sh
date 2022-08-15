 #!/usr/bin/env sh

WORKDIR="$HOME/bootstrap"


core=(

	"linux-headers"
	"lightdm"
	"zsh"
	"udiskie"
	"wmctrl"
	"xorg-xwininfo"
	"xorg-xprop"
)

compositors=(
	"picom-jonaburg-git"
	"picom"
)

utility=(
	"flameshot"
)

fonts=(
	"wqy-zenhei"
)

programming_packages=(
	"nodejs"
    "npm"
	"code"
)

nvidia_packages=(
	# NOTE: Please read https://wiki.archlinux.org/index.php/NVIDIA
	"nvidia"
    "nvidia-settings"
)

aurpackages=(
	"wpgtk"
	"protonvpn"
	"pfetch"
	"betterlockscreen"
	"cava"
	"jellyfin-media-player"
	"lightdm-webkit2-theme-glorious"
	"pipes.sh"
	"xone-dkms"
	"macchina"
	"clipit"
	"networkmanager-dmenu-git"

	"i3lock-color"
	"gdlauncher"
)

echo ${programming_packages[*]}
echo ${nvidia_packages[*]}

echo ${aurpackages[*]}