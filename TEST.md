
```
# this should return error
## openssl dgst -md5 -hex TEST.md
# this shouldn't
# OPENSSL_CONF=/usr/local/ssl/openssl.cnf.dist openssl dgst -md5 -hex TEST.md

cd openssl
go test
```