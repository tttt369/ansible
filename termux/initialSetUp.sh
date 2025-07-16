#!/bin/bash

# パッケージの更新
pkg update

# ストレージのセットアップ
termux-setup-storage

# proot-distroのインストール
pkg install -y proot-distro neovim

# Arch Linuxのインストール
proot-distro install archlinux

# Arch Linuxにログインし、ストレージをバインド
proot-distro login archlinux --bind ~/storage:/mnt

# Ansibleプレイブックの実行
pacman -S git neovim

git clone https://github.com/tttt369/ansible.git

ansible-playbook -i ~/ansible/termux/hosts ~/ansible/termux/playbook.yml
