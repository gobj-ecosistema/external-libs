#!/bin/bash

#  Exit immediately if a command exits with a non-zero status.
set -e

rm -rf build/
mkdir build
cd build

echo "extrae curl"
tar xzf ../sources/curl-7.65.1.tar.gz

echo "extrae jannson"
tar xzf ../sources/jansson-2.13.1.tar.gz

echo "extrae libunwind"
tar xzf ../sources/libunwind-1.3.1.tar.gz

echo "extrae libuv"
tar xzf ../sources/libuv-1.34.0.gines.tar.gz

echo "extrae ncurses"
tar xzf ../sources/ncurses-6.0.tar.gz

echo "extrae nginx"
tar xzf ../sources/nginx-1.18.0.tar.gz

echo "extrae pcre2"
tar xzf ../sources/pcre2-10.35.tar.gz

echo "extrae sqlite"
tar xzf ../sources/sqlite-autoconf-3260000.tar.gz

echo "extrae openssl"
tar xzf ../sources/openssl-OpenSSL_1_1_1i.tar.gz

echo "extrae cjose"
tar xzf ../sources/cjose-0.6.1.tar.gz

echo "extrae oauth2"
tar xzf ../sources/liboauth2-1.3.0.tar.gz


cd ..
