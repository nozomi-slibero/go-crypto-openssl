#!/bin/bash

# OPENSSL_ia32cap="~0x200000200000000" /usr/local/bin/openssl speed -elapsed -propquery fips=yes -evp aes-256-gcm -bytes 16 -mr 2>/dev/null | grep "+F" | cut -d ":" -f 4

# Usage:
# ./benchmark.sh > benchmark.csv 2>benchmark.err

ALGOS_FILE="algos.txt"
OPENSSL_EXE="/usr/local/bin/openssl"
FLAGS=("" 'OPENSSL_ia32cap="~0x200000200000000"')
PROPS=("fips=yes" "fips=no")
BYTES=16

echo "algo 16B,aes-ni fips,aes-ni non-fips,non-aes-ni fips,non-aes-ni non-fips,"

while read -r algo; do
  echo -n "${algo},"
  for flag in "${FLAGS[@]}"; do
    #echo "Flag: ${flag}" 
    for prop in "${PROPS[@]}"; do
      #echo "Cfg: ${prop}" 
      timing=$(eval "${flag} ${OPENSSL_EXE} speed -elapsed -propquery ${prop} -evp ${algo} -bytes ${BYTES} -mr 2>/dev/null | grep \"+F\" | cut -d \":\" -f 4")
      echo -n "${timing},"
    done
  done
  echo
done <$ALGOS_FILE


