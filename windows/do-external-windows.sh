#!/bin/bash

#  Exit immediately if a command exits with a non-zero status.
set -e

cd /yuneta/development/yuneta/^gobj-ecosistema/external-libs

rm -rf build/
mkdir build
cd build

echo "extrae jannson"
tar xzf ../sources/jansson-2.13.1.tar.gz

echo "extrae libuv"
tar xzf ../sources/libuv-1.44.2.gines.tar.gz

echo "extrae pcre2"
tar xzf ../sources/pcre2-10.40.tar.gz

echo "extrae openssl"
tar xzf ../sources/openssl-OpenSSL_1_1_1q.tar.gz

echo "extrae cjose"
tar xzf ../sources/cjose-0.6.1.tar.gz

echo "extrae oauth2"
tar xzf ../sources/liboauth2-1.4.4.2.tar.gz

echo "extrae curl"
tar xzf ../sources/curl-7.65.1.tar.gz

echo "extrae argp"
tar xzf ../sources/libargp-20110921.tar.gz

cd ..

export CFLAGS="-Wno-error=char-subscripts -O0 -g3 -ggdb"

#------------------------------------------
#   openssl
#------------------------------------------
echo "===================== OPENSSL ======================="
#     --api=1.1.0 \
cd build/openssl-OpenSSL_1_1_1q
./config --prefix=/yuneta/development/output \
    --openssldir=/yuneta/bin/ssl \
    no-tests \
    enable-ssl-trace
make
make install
cd ../..

#------------------------------------------
#   Jansson
#------------------------------------------
echo "===================== JANSSON ======================="
cd build/jansson-2.13.1

mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX:PATH=/yuneta/development/output ..
make install
cd ../../..

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
#   PCRE
#------------------------------------------
# HACK WARNING en redhat usa ./configure
cd build/pcre2-10.40
./configure --prefix=/yuneta/development/output --enable-jit
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
export OPENSSL_CFLAGS="-I/yuneta/development/output/include -Wno-error=char-subscripts -O0 -g3 -ggdb"
export OPENSSL_LIBS="-L/yuneta/development/output/lib -lssl -lcrypto"

export CURL_LIBS="-L/yuneta/development/output/lib -lcurl"
export CURL_CFLAGS="-I/yuneta/development/output/include"

export JANSSON_CFLAGS="-I/yuneta/development/output/include"
export JANSSON_LIBS="-L/yuneta/development/output/lib -ljansson"
export CJOSE_CFLAGS="-I/yuneta/development/output/include"
export CJOSE_LIBS="-L/yuneta/development/output/lib -lcjose"
./configure --prefix=/yuneta/development/output  --without-apache --without-redis
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
    --without-brotli \
    --disable-telnet
make
make install
cd ../..

#------------------------------------------
#   argp
#------------------------------------------
echo "===================== CURL ======================="
cd build/libargp-20110921
./configure --prefix=/yuneta/development/output
make
make install
cp ./gllib/.libs/libargp.a /yuneta/development/output/lib/
cd ../..
