#!/bin/sh
rm wlantest.txt &> /dev/null
touch wlantest.txt &> /dev/null
ifconfig -a | grep 'w' | cut -f 1 -d ' ' >> wlantest.txt
count_tmp=`wc -l wlantest.txt`
if [ "4 wlantest.txt" = "$count_tmp" ];
then 
	echo "*************" $'\n' "*********WIFI  ENUMERATION - PASSED********" $'\n' "*********************"
else echo "********" $'\n' "*********************WIFI ENUMERATION - FAILED********" $'\n' "*********************"
 exit 1
echo $b
echo $'\n'
echo $a
fi
