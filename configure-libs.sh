#!/bin/bash

#  Exit immediately if a command exits with a non-zero status.
set -e

#------------------------------------------
#   openssl
#------------------------------------------
echo "===================== OPENSSL ======================="
#     --api=1.1.0 \
cd build/openssl-OpenSSL_1_1_1d
./config \
    --prefix=/yuneta/development/output \
    --openssldir=/yuneta/bin/ssl \
    --strict-warnings
make
make install
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
    --disable-telnet
make
make install
cd ../..

#------------------------------------------
#   Jansson
#------------------------------------------
echo "===================== JANSSON ======================="
cd build/jansson-2.12
autoreconf -i # do if first installation
./configure --prefix=/yuneta/development/output
make
make install
cd ../..


#------------------------------------------
#   Libunwind
#------------------------------------------
echo "===================== UNWIND ======================="
cd build/libunwind-1.3.1
./configure --prefix=/yuneta/development/output
make
make install

cd ../..


#------------------------------------------
#   Libuv
#------------------------------------------
echo "===================== LIBUV ======================="
cd build/libuv-1.34.0.gines
sh autogen.sh
./configure --prefix=/yuneta/development/output
make
make install

cd ../..

#------------------------------------------
#   libncurses
#------------------------------------------
echo "===================== NCURSES ======================="
cd build/ncurses-6.0

# HACK in recents gcc ncurses will fail.
# WARNING **Before** make configure_ncurses.sh do:
export CPPFLAGS="-P" #Fallo arreglado con la version ncurses-6.0 ?

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
cd build/nginx-1.16.1
./configure \
    --prefix=/yuneta/bin/nginx \
    --with-http_ssl_module \
    --with-stream \
    --with-stream_ssl_module \
    --with-openssl=/yuneta/development/yuneta/^gobj-ecosistema/external-libs/build/openssl-OpenSSL_1_1_1d
make
make install

cd ../..

#------------------------------------------
#   odpi
#   Extraer los includes y copiar include de sources/oracle_oci/instantclient-sdk...
#   en development/output/include
#------------------------------------------
echo "===================== ODPI ======================="
cd build/odpi-3.2.2
make install PREFIX=/yuneta/development/output

cd ../..


#------------------------------------------
#   PCRE
#------------------------------------------
# HACK WARNING en redhat usa ./configure
echo "===================== PCRE ======================="
cd build/pcre2-10.34
./configure --prefix=/yuneta/development/output \
    --enable-jit
make
make install

cd ../..

#------------------------------------------
#   Sqlite
#------------------------------------------
echo "===================== SQLITE ======================="
cd build/sqlite-autoconf-3260000
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
cd build/liboauth2-1.1.1
sh autogen.sh
export OPENSSL_CFLAGS="-I/yuneta/development/output/include"
export OPENSSL_LIBS="-L/yuneta/development/output/lib -lssl -lcrypto"

export CURL_LIBS="-L/yuneta/development/output/lib -lcurl"
export CURL_CFLAGS="-I/yuneta/development/output/include"

export JANSSON_CFLAGS="-I/yuneta/development/output/include"
export JANSSON_LIBS="-L/yuneta/development/output/lib -ljansson"
export CJOSE_CFLAGS="-I/yuneta/development/output/include"
export CJOSE_LIBS="-L/yuneta/development/output/lib -lcjose"
./configure --prefix=/yuneta/development/output  --without-apache
make
make install

cd ../..


#------------------------------------------
#   libsodium
#   https://github.com/jedisct1/libsodium/releases
#------------------------------------------
echo "===================== LIBSODIUM ======================="
cd build/libsodium-1.0.18
./configure \
    --prefix=/yuneta/development/output
make
make install

cd ../..


