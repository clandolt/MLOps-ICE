# Kickstart file for Rocky Linux 8
#version=DEVEL

# GUI/TUI: Use textual install
text

# System Language
lang en_US.UTF-8

# Keyboard Layout: Swiss German
keyboard --vckeymap=ch --xlayouts='ch'

# Swiss German keyboard layout without dead keys
# preseed keyboard-configuration/xkb-keymap select ch sg

# Installation Media: Use CDROM installation media
cdrom

# System Timezone
timezone Europe/Zurich --utc

# Network configuration
# Network: Set Hostname
network --hostname=hpc108.ost.ch
network --bootproto=static --device=eth0 --ip=146.136.15.208 --netmask=255.255.252.0 --gateway=146.136.15.1 --nameserver=152.96.48.12 --nameserver=146.136.48.11 --ipv6=auto --activate

# Run the Setup Agent on first boot
firstboot --enable

# Firewall configuration
firewall --enabled --service=ssh

# SELinux configuration
selinux --enforcing

# Root user setup
user --name=root --password=passwort

# System services
services --enabled="sshd"

ignoredisk --only-use=vda,nvme0n1

# Partition clearing information
clearpart --none --initlabel

# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=vda

# Disk: Automatic Partitioning
autopart --type=lvm

# Packages and installation
%packages
@core
kexec-tools
%end

%post
# Additional post-installation commands, if needed

# Schedule a reboot after installation
reboot
%end