#!/bin/bash

# Link to the binary
ln -sf /opt/HipChatForDesktop/UnofficialHipChat /usr/local/bin/hipchatfordesktop

# Launcher icon
desktop-file-install /opt/HipChatForDesktop/hipchatfordesktop.desktop
