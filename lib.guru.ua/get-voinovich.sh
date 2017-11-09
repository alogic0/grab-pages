wget -O monument-orig.html http://lib.guru.ua/PROZA/WOJNOWICH/monument.txt
iconv -f cp1251 -t utf-8 < monument-orig.html > monument-utf8.html
runhaskell grab-voinovich monument-utf8.html > monument.html
