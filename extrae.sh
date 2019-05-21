rm -rf build/
mkdir build
cd build

# MANUALLY unzip, only if using ocilib (for oracle)
# unzip ../sources/oracle_oci/instantclient-basic-linux.x64-11.2.0.4.0.zip -d /yuneta/development/output/lib
# unzip ../sources/oracle_oci/instantclient-sdk-linux.x64-11.2.0.4.0.zip -d /yuneta/development/output/include
# ln -s /yuneta/development/output/lib/instantclient_11_2/libclntsh.so.11.1 /yuneta/development/output/lib/instantclient_11_2/libclntsh.so
# sudo ln -s /yuneta/development/output/lib/instantclient_11_2/libclntsh.so.11.1 /usr/lib/libclntsh.so
# sudo ln -s /yuneta/development/output/lib/instantclient_11_2/libclntsh.so.11.1 /usr/lib/
# sudo ln -s /yuneta/development/output/lib/instantclient_11_2/libnnz11.so /usr/lib
# sudo ln -s /yuneta/development/output/lib/instantclient_11_2/libociei.so /usr/lib

# sudo ln -s  /yuneta/development/output/lib/libodpic.so.3.1.4 /usr/lib/libodpic.so
# sudo ln -s  /yuneta/development/output/lib/libodpic.so.3.1.4 /usr/lib/libodpic.so.3
# sudo ln -s  /yuneta/development/output/lib/libodpic.so.3.1.4 /usr/lib/

# TODO parece que no hace falta
# sudo ln -s /yuneta/development/output/lib/instantclient_11_2/libocijdbc11.so /usr/lib

echo "extrae curl"
tar xzf ../sources/curl-7.64.1.tar.gz
echo "extrae jannson"
tar xzf ../sources/jansson-2.12.tar.gz
echo "extrae libunwind"
tar xzf ../sources/libunwind-1.2.1.tar.gz
echo "extrae libuv"
tar xzf ../sources/libuv-1.28.0.gines.tar.gz
echo "extrae ncurses"
tar xzf ../sources/ncurses-6.0.tar.gz
echo "extrae nginx"
tar xzf ../sources/nginx-1.15.12.tar.gz

echo "extrae odpi"
tar xzf ../sources/odpi-3.1.0.tar.gz

echo "extrae pcre2"
tar xzf ../sources/pcre2-10.33.tar.gz
echo "extrae rrdtool"
tar xzf ../sources/rrdtool-1.6.0.tar.gz
# tar xzf ../sources/sqlite-autoconf-3190300.tar.gz
echo "extrae sqlite"
tar xzf ../sources/sqlite-autoconf-3260000.tar.gz
echo "extrae openssl"
tar xzf ../sources/openssl-OpenSSL_1_1_1b.tar.gz

echo "extrae cjose"
tar xzf ../sources/cjose-0.6.1.tar.gz

echo "extrae oauth2"
tar xzf ../sources/liboauth2-1.0.0.tar.gz

cd ..
