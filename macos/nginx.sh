#!/usr/bin/bash

if [ -f /usr/local/etc/nginx/nginx.conf ]
then
    echo "nginx成功安装"

    cp -rf ~/ADotfile/projects/abyss_public/ADotfile/option/nginx/* /usr/local/etc/nginx/
    rm -rf /usr/local/etc/nginx/nginx/conf.d
    cp -f ~/ADotfile/projects/abyss_public/ADotfile/option/nginx/my.conf /usr/local/etc/nginx/conf.d/
else
    echo "nginx未安装"
fi
