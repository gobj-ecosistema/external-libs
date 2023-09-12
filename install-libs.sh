#!/bin/bash

#  Exit immediately if a command exits with a non-zero status.
set -e

#------------------------------------------
#   openssl
#------------------------------------------
cd build/openssl-3.1.2
make install
rm /yuneta/development/output/bin/c_rehash
rm /yuneta/development/output/bin/openssl
cd ../..

#------------------------------------------
#   curl
#------------------------------------------
cd build/curl-8.2.1
make install
cd ../..

#------------------------------------------
#   Jansson
#------------------------------------------
cd build/jansson-2.14
make install
cd ../..

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
#   cjose
#------------------------------------------
cd build/cjose-0.6.2.2
make install
cd ../..

#------------------------------------------
#   liboauth2
#------------------------------------------
cd build/liboauth2-1.5.1
make install
cd ../..
