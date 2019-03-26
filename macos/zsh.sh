#!/usr/bin/bash

cp -a ~/ADotfile/projects/abyss_public/ADotfile/macos/home/.* ~/

if [ -f ~/.aliases ]
then
    echo "文件拷贝成功！"
else
    echo "文件拷贝失败！"
fi