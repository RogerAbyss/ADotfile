#!/usr/bin/bash

if [ -f ~/ADotfile/auto_installer.rb ]
then
    echo "git pull.."
    cd ~/ADotfile&&/usr/bin/git pull
    /usr/bin/ruby ~/ADotfile/auto_installer.rb
else
    /usr/bin/git clone https://github.com/RogerAbyss/ADotfile.git ~/ADotfile
    cd ~/ADotfile&&sh bootstrap.sh
fi
