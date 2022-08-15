
ROOT_PART=/dev/sda3
SWAP_PART=/dev/sda2
EFI_PART=/dev/sda1
HOME_PART=/dev/sdb2
VAR_PART=/dev/sdb1

mount ${ROOT_PART} /mnt

[[ -n ${SWAP_PART} ]] && swapon ${SWAP_PART}

if [[ -n ${EFI_PART} ]]; then
	mkdir -p /mnt/boot
	mount ${EFI_PART} /mnt/boot
fi


timedatectl set-ntp true

# NOTE: if you don't want to install base-devel, then you can remove it.
pacstrap /mnt base base-devel ${all_packages[@]}
# NOTE: using relatime or noatime depends on what fs you use...
#genfstab -U /mnt | sed -e 's/relatime/noatime/g' >> /mnt/etc/fstab
genfstab -U /mnt >> /mnt/etc/fstab

SCRIPT_DIR=/mnt/scripts
mkdir -p $SCRIPT_DIR
mv chroot.sh $SCRIPT_DIR
arch-chroot /mnt zsh /scripts/chroot.sh $ROOT_PART

rm -r /mnt/scripts

umount -R /mnt
reboot