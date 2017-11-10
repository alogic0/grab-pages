#!/bin/bash

## echo "Usage: $0 http://lib.guru.ua/PROZA/WOJNOWICH/monument.txt"; exit
SRC=$(basename "$1")

FN=${SRC%.*}-utf8.html
DST=${SRC%.*}-pr.html
wget -nc -O $SRC "$1" 
iconv -f cp1251 -t utf-8 < $SRC > $FN && echo $FN
runghc grab-libguru $FN > $DST
echo Your file in $DST
