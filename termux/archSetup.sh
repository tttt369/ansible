#!/bin/bash

echo "Updating system..."
pacman -Syu

echo "Installing development and utility packages..."
pacman -S --noconfirm \
    sudo \
    neovim \
    base-devel \
    git \
    wget \
    github-cli \
    btop \
    fish \
    ranger \
    python \
    python-pip \
    curl \
    unzip \
    ripgrep \
    procps \
    gcc \
    nodejs \
    jdk-openjdk \
    clang \
    cmake \
    ninja \
    ttf-jetbrains-mono-nerd \
    tree \
    fastfetch \
    uv

echo "Changing root's default shell to fish..."
if chsh -s /usr/bin/fish root 2>/dev/null; then
    echo "Successfully changed root's default shell to fish"
else
    echo "Failed to change shell or chsh not available, manually adding to /etc/shells..."
    # Fallback: ensure fish is in /etc/shells and set via passwd
    if ! grep -q "/usr/bin/fish" /etc/shells 2>/dev/null; then
        echo "/usr/bin/fish" >> /etc/shells
    fi
    usermod -s /usr/bin/fish root 2>/dev/null && echo "Successfully changed root's default shell to fish" || echo "Warning: Could not change root shell automatically"
fi

echo "Installation completed!"
