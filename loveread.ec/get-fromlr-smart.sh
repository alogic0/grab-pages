#!/bin/bash

## echo "Usage: $0 270 voinovich_shapka"; exit

DIR="$(dirname $0)"
pushd "$DIR" >/dev/null
DIR="$(pwd)"
popd >/dev/null

IDB=$1
BNM=$2
function get-body () {
  PGN=$1
  SRC=${BNM}-$PGN.html
  FN=${SRC%.*}-utf8.html
  DST=${SRC%.*}-pr.html
  wget -nv -nc -O $SRC 'http://loveread.ec/read_book.php?id='${IDB}'&p='${PGN}
  iconv -f cp1251 -t utf-8 < $SRC > $FN && echo $FN && rm $SRC
  ${DIR}/grab-fromlr-2 $FN > $DST && echo "Out: $DST"
  echo $PGN of $PGUP
}
HDR=${BNM}-head.html
BODY=${BNM}-body.html

TMP="${IDB}-${BNM}"
mkdir $TMP || exit 1
cd "$TMP" || exit 1
cat /dev/null > $BODY
get-body 1;
PGUP=$(${DIR}/get-numpages ${BNM}-1-utf8.html || exit 1)
echo Pages: $PGUP
echo "dir $(pwd)"; echo press any key ...; read zz
for i in $(seq 1 $PGUP); 
  do get-body $i;
  cat ${BNM}-${i}-pr.html >> $BODY;
done 
${DIR}/grab-fromlr-head ${BNM}-1-utf8.html > ${BNM}-head.html
cat $HDR $BODY ${DIR}/foot.html > ${BNM}.html
rm -v ${BNM}-*-pr.html $HDR $BODY
cd ..
echo "Your book is here: ${TMP}/${BNM}.html"
