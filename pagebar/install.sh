#!/usr/bin/env bash

clear #My Way

[[ ! -e /usr/bin/sudo ]] && echo -e "Looks like sudo isn't installed. \nPlease copy cpu-stat, pagebar(-blocks or -noblocks) and\
pagebarsig to /usr/bin directory" && exit 64
[[ $(id -u) -ne 0 ]] && echo -en "This Script need Root privileges.\nPlease Enter your root password: " && read Password

## Check Root Password
echo "$Password" | sudo -S echo -n 2>/dev/null
[[ ! -z "$(echo "$Password" | sudo -S echo -n 2>&1 )" ]] && echo "Password Incorrect!" && exit 64

echo -en "\nChoose One varient:\n1. Pagebar-block\n2. Pagebar-noblock\n\nInput:"
read -sn1 Input
mkdir -p tmp

case $Input in
	'1')
		cp pagebar-block tmp/pagebar
		;;
	'2')
		cp pagebar-noblocks tmp/pagebar
		;;
esac

IfError+=$(echo $Password | sudo -S  cp bin/cpu-stat tmp/pagebar pagebarsig /usr/bin/ 2>&1)
mkdir -p "$HOME/.config/pagebar"
cp config.sh "$HOME/.config/pagebar/"
[[ -z $IfError ]] && echo -e "\nDone sucessfully." || echo "\nError encountered:" && echo -e "\n$IfError"


