# Kickstart file for Rocky Linux
#version=DEVEL

# System settings
lang en_US.UTF-8
keyboard us

# Swiss German keyboard layout without dead keys
preseed keyboard-configuration/xkb-keymap select ch sg

# Installation information
url --url="https://download.rockylinux.org/stg/rocky/8/BaseOS/$basearch/os/"

# System timezone Zuerich
timezone Europe/Zurich --isUtc

bootloader --location=mbr --boot-drive=sda
zerombr
clearpart --all --initlabel

# Network configuration
network --bootproto=static --ip=146.136.15.208 --netmask=255.255.252.0 --gateway=146.136.15.1 --nameserver=152.96.48.12 --nameserver=146.136.48.11 --hostname=hpc108.ost.ch

# Firewall configuration
firewall --enabled --service=ssh
firstboot --disable

# SELinux configuration
selinux --enforcing

# Root user setup
user --name=root --password=passwort

# Packages and installation
%packages
@core
kexec-tools
%end

%post
# Additional post-installation commands, if needed
%end