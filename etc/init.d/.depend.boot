TARGETS = mountkernfs.sh udev mountdevsubfs.sh bootlogd keymap.sh keyboard-setup console-setup checkroot.sh mountall.sh mountoverflowtmp networking ifupdown urandom mountnfs.sh mountnfs-bootclean.sh mdadm-raid ifupdown-clean fuse hostname.sh checkfs.sh bootmisc.sh hwclockfirst.sh kbd procps module-init-tools udev-mtab mountall-bootclean.sh pppd-dns mtab.sh vyatta-config-reboot-params stop-bootlogd-single screen-cleanup
INTERACTIVE = udev keymap.sh keyboard-setup console-setup checkroot.sh checkfs.sh kbd
udev: mountkernfs.sh
mountdevsubfs.sh: mountkernfs.sh udev
bootlogd: mountdevsubfs.sh
keymap.sh: mountdevsubfs.sh bootlogd
keyboard-setup: mountkernfs.sh keymap.sh udev bootlogd
console-setup: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh kbd
checkroot.sh: mountdevsubfs.sh hostname.sh keymap.sh hwclockfirst.sh bootlogd keyboard-setup
mountall.sh: mdadm-raid checkfs.sh
mountoverflowtmp: mountall-bootclean.sh
networking: mountkernfs.sh mountall.sh mountoverflowtmp ifupdown
ifupdown: ifupdown-clean
urandom: mountall.sh mountoverflowtmp
mountnfs.sh: mountall.sh mountoverflowtmp networking ifupdown
mountnfs-bootclean.sh: mountall.sh mountoverflowtmp mountnfs.sh
mdadm-raid: mountkernfs.sh hostname.sh udev
ifupdown-clean: checkroot.sh
fuse: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
hostname.sh: bootlogd
checkfs.sh: mdadm-raid checkroot.sh mtab.sh
bootmisc.sh: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh udev
hwclockfirst.sh: mountdevsubfs.sh bootlogd
kbd: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
procps: mountkernfs.sh mountall.sh mountoverflowtmp udev module-init-tools bootlogd
module-init-tools: vyatta-config-reboot-params checkroot.sh
udev-mtab: udev mountall.sh mountoverflowtmp
mountall-bootclean.sh: mountall.sh
pppd-dns: mountall.sh mountoverflowtmp
mtab.sh: checkroot.sh
vyatta-config-reboot-params: mountall.sh mountoverflowtmp
stop-bootlogd-single: mountall.sh mountoverflowtmp udev keymap.sh keyboard-setup console-setup checkroot.sh networking ifupdown urandom mountnfs.sh mountnfs-bootclean.sh mdadm-raid mountkernfs.sh ifupdown-clean fuse hostname.sh checkfs.sh bootmisc.sh mountdevsubfs.sh hwclockfirst.sh bootlogd kbd procps module-init-tools udev-mtab mountall-bootclean.sh pppd-dns mtab.sh vyatta-config-reboot-params screen-cleanup
screen-cleanup: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
