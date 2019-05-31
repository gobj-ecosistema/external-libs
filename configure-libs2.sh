#!/bin/bash

#------------------------------------------
#   cjose
#------------------------------------------
echo "===================== CJOSE ======================="
cd build/cjose-0.6.1
./configure \
    --prefix=/yuneta/development/output \
    --disable-doxygen-doc \
    --with-openssl=/yuneta/development/output/lib \
    --with-jansson=/yuneta/development/output
cd ../..

#------------------------------------------
#   liboauth2
#------------------------------------------
echo "===================== LIBOAUTH2 ======================="
cd build/liboauth2-1.0.0
sh autogen.sh
export JANSSON_CFLAGS="-I/yuneta/development/output/include"
export JANSSON_LIBS="-L/yuneta/development/output/lib -ljansson"
export CJOSE_CFLAGS="-I/yuneta/development/output/include"
export CJOSE_LIBS="-L/yuneta/development/output/lib -lcjose"
./configure --prefix=/yuneta/development/output  --without-apache
cd ../..
