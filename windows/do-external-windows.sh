#!/bin/bash

#  Exit immediately if a command exits with a non-zero status.
set -e

cd /c/yuneta/development/yuneta/^gobj-ecosistema/external-libs

#rm -rf build/
mkdir build
cd build

echo "extrae jannson"
tar xzf ../sources/jansson-2.13.1.tar.gz

echo "extrae libuv"
tar xzf ../sources/libuv-1.44.2.gines.tar.gz

echo "extrae pcre2"
tar xzf ../sources/pcre2-10.40.tar.gz

#echo "extrae openssl"
#tar xzf ../sources/openssl-OpenSSL_1_1_1q.tar.gz

#echo "extrae cjose"
#tar xzf ../sources/cjose-0.6.1.tar.gz
#
#echo "extrae oauth2"
#tar xzf ../sources/liboauth2-1.4.4.2.tar.gz
#
#echo "extrae curl"
#tar xzf ../sources/curl-7.65.1.tar.gz
#
#echo "extrae argp"
#tar xzf ../sources/libargp-20110921.tar.gz

cd ..

#------------------------------------------
#   Jansson
#   To compile: open build/jansson-2.13.1 with clion
#     and set in CMake options:
#       -DCMAKE_INSTALL_PREFIX:PATH=c:/yuneta/development/output
#   (the generared sln project cannot be open well with Visual Studio 2022)
#   And add to CMakeLists.txt the line:
#
#set(JANSSON_HDR_PUBLIC
#   ${CMAKE_CURRENT_BINARY_DIR}/include/jansson_config.h
#   ${CMAKE_CURRENT_BINARY_DIR}/include/jansson_private.h
#   ${CMAKE_CURRENT_SOURCE_DIR}/src/jansson.h)
#------------------------------------------


#------------------------------------------
#   Libuv
#------------------------------------------
#echo "===================== LIBUV ======================="
#cd build/libuv-1.44.2.gines
#sh autogen.sh
#./configure --prefix=/c/yuneta/development/output
#make
#make install
#cd ../..

#------------------------------------------
#   openssl
#------------------------------------------
#echo "===================== OPENSSL ======================="
#cd build/openssl-OpenSSL_1_1_1q
#./config --prefix=/c/yuneta/development/output \
#    --openssldir=/yuneta/bin/ssl \
#    no-tests \
#    enable-ssl-trace
#make
#make install
#cd ../..

#------------------------------------------
#   PCRE
#------------------------------------------
#cd build/pcre2-10.40
#./configure --prefix=/c/yuneta/development/output --enable-jit
#make
#make install
#cd ../..

#------------------------------------------
#   cjose
#   https://github.com/cisco/cjose/releases
#------------------------------------------
#echo "===================== CJOSE ======================="
#cd build/cjose-0.6.1
#./configure \
#    --prefix=/c/yuneta/development/output \
#    --disable-doxygen-doc \
#    --with-openssl=/c/yuneta/development/output \
#    --with-jansson=/c/yuneta/development/output
#make
#make install
#cd ../..

#------------------------------------------
#   liboauth2
#   https://github.com/zmartzone/liboauth2/releases
#------------------------------------------
#echo "===================== LIBOAUTH2 ======================="
#cd build/liboauth2-1.4.4.2
#sh autogen.sh
#export OPENSSL_CFLAGS="-I/yuneta/development/output/include -Wno-error=char-subscripts -O0 -g3 -ggdb"
#export OPENSSL_LIBS="-L/yuneta/development/output/lib -lssl -lcrypto"
#
#export CURL_LIBS="-L/yuneta/development/output/lib -lcurl"
#export CURL_CFLAGS="-I/yuneta/development/output/include"
#
#export JANSSON_CFLAGS="-I/yuneta/development/output/include"
#export JANSSON_LIBS="-L/yuneta/development/output/lib -ljansson"
#export CJOSE_CFLAGS="-I/yuneta/development/output/include"
#export CJOSE_LIBS="-L/yuneta/development/output/lib -lcjose"
#./configure --prefix=/c/yuneta/development/output  --without-apache --without-redis
#make
#make install
#cd ../..

#------------------------------------------
#   curl
#------------------------------------------
# HACK WARNING reinstall the tar.gz before configure
#echo "===================== CURL ======================="
#cd build/curl-7.65.1
#./configure --prefix=/c/yuneta/development/output \
#    --with-ssl=/c/yuneta/development/output \
#    --enable-static \
#    --enable-http \
#    --enable-pop3 \
#    --enable-imap \
#    --enable-smtp \
#    --without-librtmp \
#    --without-libssh2 \
#    --without-libidn2 \
#    --disable-ldap \
#    --disable-ldaps \
#    --without-brotli \
#    --disable-telnet
#make
#make install
#cd ../..

#------------------------------------------
#   argp
#------------------------------------------
#echo "===================== CURL ======================="
#cd build/libargp-20110921
#./configure --prefix=/c/yuneta/development/output
#make
#make install
#cp ./gllib/.libs/libargp.a /yuneta/development/output/lib/
#cd ../..
