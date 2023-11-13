#!/bin/bash

#  Exit immediately if a command exits with a non-zero status.
set -e

rm -rf build/
mkdir build
cd build

echo "extrae curl"
tar xzf ../sources/curl-7.65.1.tar.gz

echo "extrae jannson"
tar xzf ../sources/jansson-2.14.tar.gz

echo "extrae libunwind"
tar xzf ../sources/libunwind-1.5.tar.gz

echo "extrae libuv"
tar xzf ../sources/libuv-1.44.2.gines.tar.gz

echo "extrae ncurses"
tar xzf ../sources/ncurses-6.3.tar.gz

echo "extrae nginx"
tar xzf ../sources/nginx-1.24.0.tar.gz

echo "extrae pcre2"
tar xzf ../sources/pcre2-10.42.tar.gz

echo "extrae sqlite"
tar xzf ../sources/sqlite-autoconf-3430100.tar.gz

echo "extrae openssl"
tar xzf ../sources/openssl-1.1.1u.tar.gz

echo "extrae cjose"
tar xzf ../sources/cjose-0.6.1.tar.gz

echo "extrae oauth2"
tar xzf ../sources/liboauth2-1.5.2.tar.gz


cd ..
