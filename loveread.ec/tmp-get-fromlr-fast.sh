#!/bin/bash

## echo "Usage: $0 270 28 voinovich_shapka"; exit
IDB=$1
PGUP=$2
BNM=$3
function get-body () {
  PGN=$1
  SRC=${BNM}-$PGN.html
  FN=${SRC%.*}-utf8.html
  DST=${SRC%.*}-pr.html
  wget -nv -nc -O $SRC 'http://loveread.ec/read_book.php?id='${IDB}'&p='${PGN}
  iconv -f cp1251 -t utf-8 < $SRC > $FN && echo $FN && rm $SRC
  ../grab-fromlr-2 $FN > $DST && echo "Out: $DST"
}
HDR=${BNM}-head.html
BODY=${BNM}-body.html

TMP="${BNM}-${IDB}"
mkdir "$TMP" || exit 1
cd "$TMP" || exit 1
cat /dev/null > $BODY
for i in $(seq 1 $PGUP); 
  do get-body $i;
  cat ${BNM}-${i}-pr.html >> $BODY;
done 
../grab-fromlr-head ${BNM}-1-utf8.html > ${BNM}-head.html
cat $HDR $BODY ../foot.html > ${BNM}.html
rm -v ${BNM}-*-pr.html $HDR $BODY
echo "Your book is: ${TMP}/${BNM}.html"
cd ..
