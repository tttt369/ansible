#!/bin/bash

pkg update
termux-setup-storage
pkg install -y proot-distro neovim termux-api
proot-distro install archlinux
cp -r ~/ansible ~/storage
proot-distro login archlinux --bind ~/storage:/mnt
