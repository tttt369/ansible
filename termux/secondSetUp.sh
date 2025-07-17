#!/bin/bash

pacman -Syu
pacman -S ansible neovim sudo
ansible-playbook -i /mnt/ansible/termux/hosts /mnt/ansible/termux/playbook.yml
