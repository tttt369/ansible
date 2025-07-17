#!/bin/bash

# パッケージの更新
pkg update

# ストレージのセットアップ
termux-setup-storage

# proot-distroのインストール
pkg install -y proot-distro neovim

# Arch Linuxのインストール
proot-distro install archlinux

cp -r ../ansible ~/storage

# Arch Linuxにログインし、ストレージをバインド
proot-distro login archlinux --bind ~/storage:/mnt
