#!/bin/bash

mkdir -p ~/.termux/boot

echo "make stopApp.sh"
echo '#!/data/data/com.termux/files/usr/bin/sh
sudo /system/bin/am force-stop com.android.gallery3d
sudo /system/bin/am force-stop com.android.documentsui
sudo /system/bin/am force-stop com.android.settings
sudo /system/bin/am force-stop com.mixexplorer.beta
sudo /system/bin/am force-stop com.kiwibrowser.browser.dev
sudo /system/bin/am force-stop com.google.android.inputmethod.latin
sudo /system/bin/am force-stop org.mozilla.firefox_beta
sudo /system/bin/am force-stop com.android.chrome
sudo /system/bin/am force-stop com.aurora.store
sudo /system/bin/am force-stop org.schabi.newpipe
sudo /system/bin/am force-stop com.metrolist.music
sudo /system/bin/am force-stop org.mozilla.firefox
sudo /system/bin/am force-stop app.attestation.auditor
sudo /system/bin/am force-stop com.ichi2.anki' > ~/.termux/boot/stopApp.sh

echo "Change permission"
sudo chmod 755 ~/.termux/boot/stopApp.sh
