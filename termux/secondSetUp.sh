#!/bin/bash

pacman -Syu
pacman -S ansible neovim
proot-distro login archlinux --bind ~/storage:/mnt
ansible-playbook -i /mnt/ansible/termux/hosts /mnt/ansible/termux/playbook.yml
