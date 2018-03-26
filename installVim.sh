#!/bin/bash

cd ~/vim/
./configure \
    --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp=yes \
    --enable-python3interp=yes \
    --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/ \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-gui=auto \
    --enable-cscope \
    --enable-terminal \
    --enable-fontset \
    --prefix=/usr/local \
    --enable-fail-if-missing

make VIMRUNTIMEDIR=/usr/local/share/vim/vim80 && make install
