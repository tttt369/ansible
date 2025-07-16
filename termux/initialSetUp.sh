#!/bin/bash

# パッケージの更新
pkg update

# ストレージのセットアップ
termux-setup-storage

# proot-distroのインストール
pkg install -y proot-distro

# Arch Linuxのインストール
proot-distro install archlinux

# Arch Linuxにログインし、ストレージをバインド
proot-distro login archlinux --bind ~/storage:/mnt

# Ansibleプレイブックの実行
ansible-playbook -i ~/ansible/termux/hosts ~/ansible/termux/playbook.yml

