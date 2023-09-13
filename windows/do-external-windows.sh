#!/bin/bash

#  Exit immediately if a command exits with a non-zero status.
set -e

cd /c/yuneta/development/yuneta/^gobj-ecosistema/external-libs

#rm -rf win_build/
mkdir win_build
cd win_build

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

#  Para todos los projectos:
#  - Con mkdir win_build; cd win_build; cmake ..; #creas el projecto visual c sln
#  - O abres el CMakeLists.txt con Clion.
#    En Clion Pones en todos:
#       and set in CMake options:
#       -DCMAKE_INSTALL_PREFIX:PATH=c:/yuneta/development/output
