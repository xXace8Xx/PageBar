#!/usr/bin/env bash

[[ ! -e /usr/bin/sudo ]] && echo -e "Looks like sudo isn't installed. \nPlease copy cpu-stat, pagebar, and\
pagebarsig to /usr/bin directory" && exit 64

[[ $(id -u) -ne 0 ]] && echo -en "This Script need Root privileges.\nPlease Enter your root password: " && read $Password

IfError=$(echo $Password | sudo -S cp cpu-stat pagebar pagebarsig /usr/bin/ 2>&1)
[[ -z $IfError ]] && echo "Done sucessfully." || echo "Error encountered." && echo -e "\n$IfError"


