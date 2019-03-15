#!/usr/bin/bash

if [ -f ~/ADotfile/auto_installer.rb ]
then
    cd ~/ADotfile&&/usr/bin/git pull&&/usr/bin/ruby ./auto_installer.rb
else
    /usr/bin/git clone https://github.com/RogerAbyss/ADotfile.git ~/ADotfile
    cd ~/ADotfile&&sh bootstrap.sh
fi
