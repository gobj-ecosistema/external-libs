#!/bin/bash

#  Exit immediately if a command exits with a non-zero status.
set -e

export CFLAGS="-Wno-error=char-subscripts -O0 -g3 -ggdb"

#------------------------------------------
#   openssl
#------------------------------------------
echo "===================== OPENSSL ======================="
#     --api=1.1.0 \
cd build/openssl-1.1.1u
./config \
    --prefix=/yuneta/development/output \
    --openssldir=/yuneta/bin/ssl \
    --libdir=lib \
    no-tests \
    enable-ssl-trace
make
make install
rm /yuneta/development/output/bin/openssl
cd ../..

#------------------------------------------
#   curl
#------------------------------------------
# HACK WARNING reinstall the tar.gz before configure
echo "===================== CURL ======================="
cd build/curl-7.65.1
./configure --prefix=/yuneta/development/output \
    --with-ssl=/yuneta/development/output \
    --enable-static \
    --enable-http \
    --enable-pop3 \
    --enable-imap \
    --enable-smtp \
    --without-librtmp \
    --without-libssh2 \
    --without-libidn2 \
    --disable-ldap \
    --disable-ldaps \
    --without-brotli \
    --disable-telnet
make
make install
cd ../..

#------------------------------------------
#   Jansson
#------------------------------------------
echo "===================== JANSSON ======================="
cd build/jansson-2.14
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=/yuneta/development/output -DJANSSON_BUILD_DOCS=OFF ..
make
make install
cd ..
#autoreconf -i # do if first installation
#./configure --prefix=/yuneta/development/output
#make
#make install

cd ../..


#------------------------------------------
#   Libunwind
#------------------------------------------
echo "===================== UNWIND ======================="
cd build/libunwind-1.5
sh autogen.sh
./configure --prefix=/yuneta/development/output
make
make install
cd ../..


#------------------------------------------
#   Libuv
#------------------------------------------
echo "===================== LIBUV ======================="
cd build/libuv-1.44.2.gines
sh autogen.sh
./configure --prefix=/yuneta/development/output
make
make install
cd ../..

#------------------------------------------
#   libncurses
#------------------------------------------
echo "===================== NCURSES ======================="
cd build/ncurses-6.3

# HACK in recents gcc ncurses will fail.
# WARNING **Before** make configure_ncurses.sh do:
export CPPFLAGS="-P" #Fallo arreglado con la version ncurses-6.3 ?

./configure \
    --prefix=/yuneta/development/output \
    --datarootdir=/yuneta/bin/ncurses \
    --enable-sp-funcs
#         --enable-term-driver \
#         --enable-ext-putwin
make
make install
cd ../..

#------------------------------------------
#   nginx
#------------------------------------------
# HACK sudo yum install pcre-devel.x86_64 zlib-devel.x86_64
echo "===================== NGINX ======================="
cd build/nginx-1.24.0
./configure \
    --prefix=/yuneta/bin/nginx \
    --with-http_ssl_module \
    --with-stream \
    --with-stream_ssl_module \
    --with-openssl=/yuneta/development/yuneta/^gobj-ecosistema/external-libs/build/openssl-1.1.1u \
    --with-openssl-opt=no-tests
make
make install
cd ../..

#------------------------------------------
#   PCRE
#------------------------------------------
# HACK WARNING en redhat usa ./configure
echo "===================== PCRE ======================="
cd build/pcre2-10.42
./configure --prefix=/yuneta/development/output \
    --enable-jit
make
make install
cd ../..

#------------------------------------------
#   Sqlite
#------------------------------------------
echo "===================== SQLITE ======================="
cd build/sqlite-autoconf-3430100
CFLAGS="-Os -DSQLITE_THREADSAFE=0" ./configure \
    --prefix=/yuneta/development/output \
    --enable-fts5 \
    --enable-json1 \
    --disable-threadsafe \
    --enable-session \
    --enable-readline \
    --disable-shared
make
make install
cd ../..


#------------------------------------------
#   cjose
#   https://github.com/cisco/cjose/releases
#------------------------------------------
echo "===================== CJOSE ======================="
cd build/cjose-0.6.1
./configure \
    --prefix=/yuneta/development/output \
    --disable-doxygen-doc \
    --with-openssl=/yuneta/development/output \
    --with-jansson=/yuneta/development/output
make
make install
cd ../..


#------------------------------------------
#   liboauth2
#   https://github.com/zmartzone/liboauth2/releases
#------------------------------------------
echo "===================== LIBOAUTH2 ======================="
cd build/liboauth2-1.4.4.2
sh autogen.sh
export OPENSSL_CFLAGS="-I/yuneta/development/output/include"
export OPENSSL_LIBS="-L/yuneta/development/output/lib -lssl -lcrypto"

export CURL_LIBS="-L/yuneta/development/output/lib -lcurl"
export CURL_CFLAGS="-I/yuneta/development/output/include"

export JANSSON_CFLAGS="-I/yuneta/development/output/include"
export JANSSON_LIBS="-L/yuneta/development/output/lib -ljansson"

export CJOSE_CFLAGS="-I/yuneta/development/output/include"
export CJOSE_LIBS="-L/yuneta/development/output/lib -lcjose"

export PCRE2_CFLAGS="-I/yuneta/development/output/include"
export PCRE2_LIBS="-L/yuneta/development/output/lib -lpcre2-8"

./configure --prefix=/yuneta/development/output  --without-apache --without-redis
make
make install
cd ../..
