rm -rf build/
mkdir build
cd build

# MANUALLY unzip, only if using ocilib (for oracle)
# unzip ../sources/oracle_oci/instantclient-basic-linux.x64-12.2.0.1.0.zip -d /yuneta/development/output/lib
# unzip ../sources/oracle_oci/instantclient-sdk-linux.x64-12.2.0.1.0.zip -d /yuneta/development/output/include
# ln -s /yuneta/development/output/lib/instantclient_12_2/libclntsh.so.12.1 /yuneta/development/output/lib/instantclient_12_2/libclntsh.so
# sudo rm /usr/lib/libclntsh.so
# sudo ln -s /yuneta/development/output/lib/instantclient_12_2/libclntsh.so.12.1 /usr/lib/libclntsh.so
# sudo ln -s /yuneta/development/output/lib/instantclient_12_2/libclntsh.so.12.1 /usr/lib/
# sudo ln -s /yuneta/development/output/lib/instantclient_12_2/libnnz12.so /usr/lib
# sudo rm /usr/lib/libociei.so
# sudo ln -s /yuneta/development/output/lib/instantclient_12_2/libociei.so /usr/lib

# TODO parece que no hace falta
# sudo ln -s /yuneta/development/output/lib/instantclient_12_2/libocijdbc12.so /usr/lib

echo "extrae curl"
tar xzf ../sources/curl-7.65.1.tar.gz
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
tar xzf ../sources/liboauth2-1.1.1.tar.gz

echo "extrae libsodium"
tar xzf ../sources/libsodium-1.0.18.tar.gz
cd ..
