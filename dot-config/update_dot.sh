#!/bin/sh

# Get current user
USER=$(whoami)

# Define directories and files
XFCE=true
XFCE_DIR="/home/$USER/.config/xfce4/xfconf/xfce-perchannel-xml/"
XFCE_ANS_DIR="./xfce4/xfconf/xfce-perchannel-xml/"
XFCE_FILES="xfce4-keyboard-shortcuts.xml xfce4-panel.xml xfwm4.xml xsettings.xml"

COPYQ=true
COPYQ_DIR="/home/$USER/.config/copyq/"
COPYQ_ANS_DIR="./copyq/"
COPYQ_FILES="copyq-commands.ini copyq.conf"

FISH=true
FISH_DIR="/home/$USER/.config/fish/"
FISH_ANS_DIR="./fish/"
FISH_FILES="config.fish fish_variables"

GWE=true
GWE_DIR="/home/$USER/.config/gwe/"
GWE_ANS_DIR="./gwe/"
GWE_FILES="gwe.db"

MOZC=true
MOZC_DIR="/home/$USER/.config/mozc/"
MOZC_ANS_DIR="./mozc/"
MOZC_FILES="config1.db"

NVIM=true
NVIM_DIR="/home/$USER/.config/nvim/"
NVIM_ANS_DIR="./nvim/"

# Create destination directories if they don't exist
mkdir -p "$XFCE_ANS_DIR" "$COPYQ_ANS_DIR" "$FISH_ANS_DIR" "$GWE_ANS_DIR" "$MOZC_ANS_DIR" "$NVIM_ANS_DIR"

# Copy xfce4 files
if [ "$XFCE" = true ]; then
    for file in $XFCE_FILES; do
        if [ -f "$XFCE_DIR/$file" ]; then
            cp "$XFCE_DIR/$file" "$XFCE_ANS_DIR/$file"
            echo "Copied $XFCE_DIR/$file to $XFCE_ANS_DIR/$file"
        else
            echo "Warning: $XFCE_DIR/$file does not exist"
        fi
    done
fi

# Copy copyq files
if [ "$COPYQ" = true ]; then
    for file in $COPYQ_FILES; do
        if [ -f "$COPYQ_DIR/$file" ]; then
            cp "$COPYQ_DIR/$file" "$COPYQ_ANS_DIR/$file"
            echo "Copied $COPYQ_DIR/$file to $COPYQ_ANS_DIR/$file"
        else
            echo "Warning: $COPYQ_DIR/$file does not exist"
        fi
    done
fi

# Copy fish files
if [ "$FISH" = true ]; then
    for file in $FISH_FILES; do
        if [ -f "$FISH_DIR/$file" ]; then
            cp "$FISH_DIR/$file" "$FISH_ANS_DIR/$file"
            echo "Copied $FISH_DIR/$file to $FISH_ANS_DIR/$file"
        else
            echo "Warning: $FISH_DIR/$file does not exist"
        fi
    done
fi

# Copy gwe files
if [ "$GWE" = true ]; then
    for file in $GWE_FILES; do
        if [ -f "$GWE_DIR/$file" ]; then
            cp "$GWE_DIR/$file" "$GWE_ANS_DIR/$file"
            echo "Copied $GWE_DIR/$file to $GWE_ANS_DIR/$file"
        else
            echo "Warning: $GWE_DIR/$file does not exist"
        fi
    done
fi

# Copy mozc files
if [ "$MOZC" = true ]; then
    for file in $MOZC_FILES; do
        if [ -f "$MOZC_DIR/$file" ]; then
            cp "$MOZC_DIR/$file" "$MOZC_ANS_DIR/$file"
            echo "Copied $MOZC_DIR/$file to $MOZC_ANS_DIR/$file"
        else
            echo "Warning: $MOZC_DIR/$file does not exist"
        fi
    done
fi

# Copy nvim directory
if [ "$NVIM" = true ]; then
    if [ -d "$NVIM_DIR" ]; then
        cp -r "$NVIM_DIR" "$NVIM_ANS_DIR"
        echo "Copied $NVIM_DIR to $NVIM_ANS_DIR"
    else
        echo "Warning: $NVIM_DIR does not exist"
    fi
fi
