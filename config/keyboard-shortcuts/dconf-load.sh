#!/bin/sh
set -e

dconf load /org/gnome/desktop/wm/keybindings/ < kb_wm.xml
dconf load /org/gnome/mutter/keybindings/ < kb_mutter.xml
