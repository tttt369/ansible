#!/bin/bash

mkdir -p ~/.shortcuts

echo "make enable_google.sh"
echo '#!/system/bin/sh

packages=(
    "app.grapheneos.gmscompat.config"
    "com.google.android.gms"
    "com.android.vending"
    "com.google.android.gsf"
)
enable=true

for package in "${packages[@]}"; do
    if $enable; then
        sudo pm enable "$package"
        echo "$package enable"
    else
        sudo pm disable-user "$package"
        echo "$package disabled"
    fi
done' > ~/.shortcuts/enable_google.sh

echo "make disable_google.sh"
echo '#!/system/bin/sh

packages=(
    "app.grapheneos.gmscompat.config"
    "com.google.android.gms"
    "com.android.vending"
    "com.google.android.gsf"
)
enable=false

for package in "${packages[@]}"; do
    if $enable; then
        sudo pm enable "$package"
        echo "$package enable"
    else
        sudo pm disable-user "$package"
        echo "$package disabled"
    fi
done' > ~/.shortcuts/disable_google.sh
