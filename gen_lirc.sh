#!/bin/bash

BRAND=SAMSUNG
DEV_NAME=DB-11115K

#Header
echo 'begin remote' >${BRAND}.${DEV_NAME}.lircd.conf
echo '' >>${BRAND}.${DEV_NAME}.lircd.conf
echo "  name  ${DEV_NAME}" >>${BRAND}.${DEV_NAME}.lircd.conf
echo '  flags RAW_CODES' >>${BRAND}.${DEV_NAME}.lircd.conf
echo '  eps            30' >>${BRAND}.${DEV_NAME}.lircd.conf
echo '  aeps          100' >>${BRAND}.${DEV_NAME}.lircd.conf
echo '' >>${BRAND}.${DEV_NAME}.lircd.conf
echo '  gap          8908' >>${BRAND}.${DEV_NAME}.lircd.conf
echo '' >>${BRAND}.${DEV_NAME}.lircd.conf
echo -e '	begin raw_codes' >>${BRAND}.${DEV_NAME}.lircd.conf

#Body
ls -1 ${BRAND}/${DEV_NAME}/*.raw | while read FN 
do
	echo -e "\tname $(basename $FN .raw)" >>${BRAND}.${DEV_NAME}.lircd.conf
	tail -n+4 $FN >>${BRAND}.${DEV_NAME}.lircd.conf
	echo >>${BRAND}.${DEV_NAME}.lircd.conf
	echo >>${BRAND}.${DEV_NAME}.lircd.conf
done

#Footer
echo -e '\tend raw_codes' >>${BRAND}.${DEV_NAME}.lircd.conf
echo '' >>${BRAND}.${DEV_NAME}.lircd.conf
echo 'end remote' >>${BRAND}.${DEV_NAME}.lircd.conf
