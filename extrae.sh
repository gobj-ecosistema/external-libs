#!/bin/bash

#  Exit immediately if a command exits with a non-zero status.
set -e

rm -rf build/
mkdir build
cd build

# MANUALLY unzip, only if using ocilib (for oracle)
# unzip ../sources/oracle_oci/instantclient-basic-linux.x64-12.2.0.1.0.zip -d /yuneta/development/output/lib
# unzip ../sources/oracle_oci/instantclient-sdk-linux.x64-12.2.0.1.0.zip -d /yuneta/development/output/include

# ll /usr/lib/libclntsh* /usr/lib/libnnz* /usr/lib/libociei* /usr/lib/libocijdbc* /usr/lib/libodpic*

# sudo rm /usr/lib/libclntsh* /usr/lib/libnnz* /usr/lib/libociei* /usr/lib/libocijdbc* /usr/lib/libodpic*
# sudo rm /usr/local/lib/libodpic*

# sudo cp /yuneta/development/output/lib/instantclient_12_2/libclntsh.so.12.1 /usr/lib/
# sudo rm /usr/lib/libclntsh.so; sudo ln -s /usr/lib/libclntsh.so.12.1 /usr/lib/libclntsh.so
# sudo cp /yuneta/development/output/lib/instantclient_12_2/libnnz12.so /usr/lib/
# sudo cp /yuneta/development/output/lib/instantclient_12_2/libociei.so /usr/lib/
# sudo cp /yuneta/development/output/lib/instantclient_12_2/libmql1.so /usr/lib/
# sudo cp /yuneta/development/output/lib/instantclient_12_2/libipc1.so /usr/lib/
# sudo cp /yuneta/development/output/lib/instantclient_12_2/libons.so /usr/lib/
# sudo cp /yuneta/development/output/lib/instantclient_12_2/libclntshcore.so.12.1 /usr/lib/
# sudo rm /usr/lib/libclntshcore.so; sudo ln -s /usr/lib/libclntshcore.so.12.1 /usr/lib/libclntshcore.so
# sudo ldconfig

# cd /usr/lib
# tar czf oracle_libs.tar.gz libclntsh.so.12.1 libclntsh.so libnnz12.so libociei.so libmql1.so libipc1.so libons.so libclntshcore.so.12.1 libclntshcore.so libodpic*

echo "extrae curl"
tar xzf ../sources/curl-7.65.1.tar.gz

echo "extrae jannson"
tar xzf ../sources/jansson-2.12.tar.gz

echo "extrae libunwind"
tar xzf ../sources/libunwind-1.3.1.tar.gz

echo "extrae libuv"
tar xzf ../sources/libuv-1.34.0.gines.tar.gz

echo "extrae ncurses"
tar xzf ../sources/ncurses-6.0.tar.gz

echo "extrae nginx"
tar xzf ../sources/nginx-1.16.1.tar.gz

echo "extrae odpi"
tar xzf ../sources/odpi-3.2.2.tar.gz

echo "extrae pcre2"
tar xzf ../sources/pcre2-10.34.tar.gz

echo "extrae sqlite"
tar xzf ../sources/sqlite-autoconf-3260000.tar.gz

echo "extrae openssl"
tar xzf ../sources/openssl-OpenSSL_1_1_1d.tar.gz

echo "extrae cjose"
tar xzf ../sources/cjose-0.6.1.tar.gz

echo "extrae oauth2"
tar xzf ../sources/liboauth2-1.1.1.tar.gz

echo "extrae libsodium"
tar xzf ../sources/libsodium-1.0.18.tar.gz
cd ..

# echo "extrae libmusl"
# tar xzf ../sources/musl-1.1.24.tar.gz
# cd ..
