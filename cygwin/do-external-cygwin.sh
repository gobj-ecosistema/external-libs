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
tar xzf ../sources/pcre2-10.37.tar.gz

echo "extrae openssl"
tar xzf ../sources/openssl-OpenSSL_1_1_1q.tar.gz

echo "extrae cjose"
tar xzf ../sources/cjose-0.6.1.tar.gz

cd ..

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
cd build/pcre2-10.37
./configure --prefix=/yuneta/development/output --enable-jit
make
make install
cd ../..

#------------------------------------------
#   openssl
#------------------------------------------
echo "===================== OPENSSL ======================="
#     --api=1.1.0 \
cd build/openssl-OpenSSL_1_1_1q
./config --prefix=/yuneta/development/output \
    --openssldir=/yuneta/bin/ssl \
    --strict-warnings \
    enable-ssl-trace
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
