#!/bin/bash

#  Exit immediately if a command exits with a non-zero status.
set -e

#------------------------------------------
#   openssl
#------------------------------------------
cd build/openssl-OpenSSL_1_1_1d
make install
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
cd build/jansson-2.12
make install
cd ../..

#------------------------------------------
#   unwind
#------------------------------------------
cd build/libunwind-1.3.1
make install
cd ../..

#------------------------------------------
#   Libuv
#------------------------------------------
cd build/libuv-1.34.0.gines
make install
cd ../..

#------------------------------------------
#   libncurses WARNING falla en kubuntu,
#   pero da igual, kubuntu ya tiene la 6.0
#   (Debian y RedHat no)
#------------------------------------------
cd build/ncurses-6.0
make install
cd ../..

#------------------------------------------
#   Nginx
#------------------------------------------
cd build/nginx-1.16.1
make install
cd ../..

#------------------------------------------
#   odpi
#------------------------------------------
cd build/odpi-3.2.2
make install PREFIX=/yuneta/development/output
cd ../..

#------------------------------------------
#   PCRE
#------------------------------------------
cd build/pcre2-10.34
make install
cd ../..

#------------------------------------------
#   Sqlite
#------------------------------------------
cd build/sqlite-autoconf-3260000
make install
cd ../..


#------------------------------------------
#   cjose
#------------------------------------------
cd build/cjose-0.6.1
make install
cd ../..

#------------------------------------------
#   liboauth2
#------------------------------------------
cd build/liboauth2-1.1.1
make install
cd ../..

#------------------------------------------
#   libsodium
#------------------------------------------
cd build/libsodium-1.0.18
make install
cd ../..

#------------------------------------------
#   musl
#------------------------------------------
cd build/musl-1.1.24
make install
cd ../..
