#!/bin/bash

#------------------------------------------
#   openssl
#------------------------------------------
echo "===================== OPENSSL ======================="
cd build/openssl-OpenSSL_1_1_1d
./config \
    --prefix=/yuneta/development/output \
    --openssldir=/yuneta/bin/ssl \
    --api=1.1.0 \
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
./configure --prefix=/yuneta/development/output \
    --libdir=/yuneta/development/output/lib \
    --includedir=/yuneta/development/output/include
make
make install
cd ../..


#------------------------------------------
#   Libunwind
#------------------------------------------
echo "===================== UNWIND ======================="
cd build/libunwind-1.2.1
./configure --prefix=/yuneta/development/output \
    --libdir=/yuneta/development/output/lib \
    --includedir=/yuneta/development/output/include
make
make install

cd ../..


#------------------------------------------
#   Libuv
#------------------------------------------
echo "===================== LIBUV ======================="
cd build/libuv-1.28.0.gines
sh autogen.sh
./configure --prefix=/yuneta/development/output \
    --libdir=/yuneta/development/output/lib \
    --includedir=/yuneta/development/output/include
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
    --libdir=/yuneta/development/output/lib \
    --includedir=/yuneta/development/output/include \
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
#   Extraer los includes y copiar include de sources/oracle_oci/instantclient-sdk... en development/output/include
#------------------------------------------
echo "===================== ODPI ======================="
cd build/odpi-3.2.2
make PREFIX=/usr
make install

cd ../..


#------------------------------------------
#   PCRE
#------------------------------------------
# HACK WARNING en redhat usa ./configure
echo "===================== PCRE ======================="
cd build/pcre2-10.33
./configure --prefix=/yuneta/development/output --libdir=/yuneta/development/output/lib --includedir=/yuneta/development/output/include --enable-jit
# mkdir build
# cd build
# cmake -DCMAKE_INSTALL_PREFIX=/yuneta/development/output -DPCRE2_SUPPORT_JIT=ON -DPCRE2_HEAP_MATCH_RECURSE=ON ..
# cd ../../..
make
make install

cd ../..

#------------------------------------------
#   rrdtool
#------------------------------------------
# echo "===================== RRDTOOL ======================="
cd build/rrdtool-1.6.0
./configure \
    --prefix=/yuneta/development/output \
    --libdir=/yuneta/development/output/lib \
    --includedir=/yuneta/development/output/include \
    --enable-static \
    --with-systemdsystemunitdir=/yuneta/development/output/lib/systemd/system
#     --enable-static-programs  # HACK esta línea bórrala en Ubuntu
#
# -lpng -lm  -lglib-2.0 -lpangocairo-1.0 -lpango-1.0 -lcairo -lgobject-2.0 -lglib-2.0 -lxml2
# -lpng -lm  -lglib-2.0 -lpangocairo-1.0 -lpango-1.0 -lcairo -lgobject-2.0 -lglib-2.0 -lxml2
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
    --libdir=/yuneta/development/output/lib \
    --includedir=/yuneta/development/output/include \
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
#------------------------------------------
echo "===================== LIBSODIUM ======================="
cd build/libsodium-1.0.18
./configure \
    --prefix=/yuneta/development/output
make
make install

cd ../..


