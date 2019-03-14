#!/usr/bin/bash

if [ -f ~/dotfiles/auto_installer.rb ]
then
    /usr/bin/ruby ./auto_installer.rb
else
    /usr/bin/git clone https://github.com/RogerAbyss/ADotfile.git ~/ADotfile
    cd ~/ADotfile&&sh bootstrap.sh
fi
