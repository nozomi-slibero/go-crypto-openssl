#!/bin/bash

sudo cp /usr/local/ssl/openssl.cnf /usr/local/ssl/openssl.cnf.bak 
echo "/usr/local/lib64" |  sudo tee -a /etc/ld.so.conf.d/libc.conf 
sudo cp scripts/openssl-3.cnf /usr/local/ssl/openssl.cnf
sudo ldconfig
/usr/local/bin/openssl version

# this should return error
## openssl dgst -md5 -hex TEST.md
# this shouldn't
# OPENSSL_CONF=/usr/local/ssl/openssl.cnf.dist openssl dgst -md5 -hex TEST.md

#cd openssl
#go test
