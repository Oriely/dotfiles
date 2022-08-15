
# NOTE: you *will* want change these lines...
export HOSTNAME=host
export USER=server
export PASS=password
export TIMEZONE=Asia/Taipei

# variable from bootstrap.sh
export ROOT_PART=$1

# locale
sed -i 's/^#\(en_US\|zh_TW\)\(\.UTF-8\)/\1\2/g' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# timezone and time sync
ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
hwclock --systohc
systemctl enable systemd-timesyncd

# hostname
echo $HOSTNAME > /etc/hostname
sed -i "8i 127.0.1.1\t$HOSTNAME.localdomain\t$HOSTNAME" /etc/hosts

# startup daemon
systemctl enable fstrim.timer # only need if using SSD
systemctl enable cups-browsed # for printer
# NOTE: if you don't want to use gnome, the following lines are useless...
systemctl enable NetworkManager
systemctl enable gdm