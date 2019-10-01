#!/usr/bin/bash
# cd ~
# First we setup the repositories so we can install lots of stuff
# Set Virtual Box repo
# wget https://raw.githubusercontent.com/ChrisTitusTech/fedora-setup/master/fedora.packages
# wget https://raw.githubusercontent.com/ChrisTitusTech/fedora-setup/master/bashrc.aliases
# Install Google Chrome repo
sudo dnf install fedora-workstation-repositories -y
# Enable google Chrome repo
sudo dnf config-manager --set-enabled google-chrome
# Enable pycharm repo
sudo dnf config-manager --set-enabled phracek-PyCharm
# Install Rpmfusion repo
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# Slack repo enable.
sudo dnf copr enable jdoss/slack-repo -y
# Install Atom repo
sudo rpm --import https://packagecloud.io/AtomEditor/atom/gpgkey
sudo sh -c 'echo -e "[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/yum.repos.d/atom.repo'
# Install Spotify repo
dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo
# Add la Capitain cursor theme repositorie 
sudo dnf copr enable tcg/themes
# Update cache for package installs
sudo dnf makecache
# vscode repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Install Dropbox
# sudo dnf install https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-2015.10.28-1.fedora.x86_64.rpm -y
# Install TeamViewer
# sudo dnf install https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm -y
# grab all packages to install
sudo dnf install -y $(cat fedora.packages)

#Custom shell prompt with aliases Source: https://www.linuxquestions.org/questions/linux-general-1/ultimate-prompt-and-bashrc-file-4175518169/
# cat ~/bashrc.aliases >> ~/.bashrc

#Disable Wayland and use Xorg
sudo sed -i '/WaylandEnable/s/^#//g' /etc/gdm/custom.conf

# laptop battery setup
sudo dnf install -y tlp tlp-rdw
sudo systemctl enable tlp.service

#Chromium browser & drm install
sudo dnf install -y chromium chromium-libs-media-freeworld
sudo dnf install -y gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free-extras gstreamer1-plugins-good-extras libdvdread libdvdnav lsdvd
sudo dnf install -y p7zip p7zip-plugins

#Brawe browser install
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install -y brave-browser
