#!/bin/bash


if [ -z "$2" ]
then
	echo "Usage: $0 <BRAND> <DEVICE_NAME>"
	exit 1
else
	BRAND=$1
	DEV_NAME=$2
fi

if [ -z "$3" ]
then
	GAP=8908
else
	GAP=$3
fi

#Header
echo 'begin remote' >${BRAND}.${DEV_NAME}.lircd.conf
echo '' >>${BRAND}.${DEV_NAME}.lircd.conf
echo "  name  ${DEV_NAME}" >>${BRAND}.${DEV_NAME}.lircd.conf
echo '  flags RAW_CODES' >>${BRAND}.${DEV_NAME}.lircd.conf
echo '  eps            30' >>${BRAND}.${DEV_NAME}.lircd.conf
echo '  aeps          100' >>${BRAND}.${DEV_NAME}.lircd.conf
echo '' >>${BRAND}.${DEV_NAME}.lircd.conf
echo "  gap          $GAP" >>${BRAND}.${DEV_NAME}.lircd.conf
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
