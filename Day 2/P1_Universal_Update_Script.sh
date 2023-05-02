#!/bin/bash

# this script make an update to your system depend in your linux distro that you use arch /debian base

# as always -d check the existance of a directory 

if [ -d /etc/pacman.d ]
then
	# The Host is based on Arch, run the pacman update command
	sudo pacman -Syu

fi

if [ -d /etc/apt ]
then
	# The Host is based on Debian or Ubuntu 
	# Run the apt version of the command 
	sudo apt update
	sudo apt dist-upgrade
fi
