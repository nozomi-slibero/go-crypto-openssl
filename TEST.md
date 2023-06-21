
```
sudo cp /usr/local/ssl/openssl.cnf /usr/local/ssl/openssl.cnf.bak 
echo "/usr/local/lib64" |  sudo tee -a /etc/ld.so.conf.d/libc.conf 
sudo cp scripts/openssl-3.cnf /usr/local/ssl/openssl.cnf
sudo ldconfig
/usr/local/bin/openssl version

# this should return error
## echo xxx | /usr/local/bin/openssl md5
# this shouldn't
# echo xxx | OPENSSL_CONF=/usr/local/ssl/openssl.cnf.bak /usr/local/bin/openssl md5

cd openssl
go test
```