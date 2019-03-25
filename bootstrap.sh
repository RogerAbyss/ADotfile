#!/usr/bin/bash

if [ -f ~/ADotfile/macos/auto_installer.rb ]
then
    echo "git pull.."
    cd ~/ADotfile&&/usr/bin/git pull
    /usr/bin/ruby ~/ADotfile/macos/auto_installer.rb $1
else
    /usr/bin/git clone https://github.com/RogerAbyss/ADotfile.git ~/ADotfile
    cd ~/ADotfile&&sh bootstrap.sh $1
fi
