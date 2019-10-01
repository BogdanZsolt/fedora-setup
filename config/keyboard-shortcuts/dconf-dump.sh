#!/bin/sh
set -e

dconf dump /org/gnome/desktop/wm/keybindings/ > kb_wm.xml
dconf dump /org/gnome/mutter/keybindings/ > kb_mutter.xml
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > kb_media.xml

