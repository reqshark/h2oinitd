#!/bin/bash

git clone https://github.com/libuv/libuv.git && cd libuv
./autogen.sh && ./configure && make && sudo make install && sudo /sbin/ldconfig
cd .. && rm -rf libuv

wget https://github.com/openssl/openssl/archive/OpenSSL_1_0_2f.tar.gz
tar xzvf OpenSSL_1_0_2f.tar.gz && rm OpenSSL_1_0_2f.tar.gz
cd openssl-OpenSSL_1_0_2f
./config --prefix=/usr/local --openssldir=/usr/local/openssl
make && make install && sudo /sbin/ldconfig
cd .. && rm -rf openssl-OpenSSL_1_0_2f

wget https://github.com/h2o/h2o/archive/v1.7.0.tar.gz
tar xzvf v1.7.0.tar.gz && rm v1.7.0.tar.gz && cd h2o-1.7.0
cmake -DWITH_BUNDLED_SSL=off .
make
sudo make install
rm -fr h2o-1.7.0
