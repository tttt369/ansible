#!/bin/bash

pacman -Syu
pacman -S ansible neovim
proot-distro login archlinux --bind ~/storage:/mnt
ansible-playbook -i ~/ansible/termux/hosts ~/ansible/termux/playbook.yml
