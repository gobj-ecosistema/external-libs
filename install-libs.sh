#!/bin/bash

#  Exit immediately if a command exits with a non-zero status.
set -e

#------------------------------------------
#   openssl
#------------------------------------------
cd build/openssl-3.1.4
make install_sw
cd ../..

#------------------------------------------
#   curl
#------------------------------------------
cd build/curl-7.65.1
make install
cd ../..

#------------------------------------------
#   Jansson
#------------------------------------------
cd build/jansson-gines-2.14
cd build
make install
cd ../../..

#------------------------------------------
#   unwind
#------------------------------------------
cd build/libunwind-1.5
make install
cd ../..

#------------------------------------------
#   Libuv
#------------------------------------------
cd build/libuv-1.44.2.gines
make install
cd ../..

#------------------------------------------
#   libncurses WARNING falla en kubuntu,
#   pero da igual, kubuntu ya tiene la 6.0
#   (Debian y RedHat no)
#------------------------------------------
cd build/ncurses-6.3
make install
cd ../..

#------------------------------------------
#   Nginx
#------------------------------------------
cd build/nginx-1.24.0
make install
cd ../..

#------------------------------------------
#   PCRE
#------------------------------------------
cd build/pcre2-10.42
make install
cd ../..

#------------------------------------------
#   Sqlite
#------------------------------------------
cd build/sqlite-autoconf-3430100
make install
cd ../..

#------------------------------------------
#   libjwt
#------------------------------------------
cd build/libjwt-1.16.0
cd build
ninja install
cd ..
cd ../..

#------------------------------------------
#   Delete own openssl curl binaries
#------------------------------------------
file_binary="/yuneta/development/output/bin/openssl"
# Check if the file exists
if [ -e "$file_binary" ]; then
    echo "Removing "$file_binary" ..."
    rm "$file_binary"
fi

file_binary="/yuneta/development/output/bin/curl"
# Check if the file exists
if [ -e "$file_binary" ]; then
    echo "Removing "$file_binary" ..."
    rm "$file_binary"
fi

file_binary="/yuneta/development/output/bin/curl-config"
# Check if the file exists
if [ -e "$file_binary" ]; then
    echo "Removing "$file_binary" ..."
    rm "$file_binary"
fi
