#!/bin/sh







#

rm test.txt > /dev/null
touch test.txt
lspci | grep '.0' | cut -f 1 -d ' ' >> test.txt
count_tmp=`wc -l test.txt`
setpci=`setpci -s 0001:02:00.0 0x3C.B=aa`

current=`setpci -s 0001:02:00.0 0x3C.B | tr -d ' '`
current=$(echo $current | tr ' ' _ | tr \" ' ')

setpci=`setpci -s 0001:02:01.0 0x3C.B=aa`

tmp=`setpci -s 0001:02:01.0 0x3C.B | tr -d ' '`
tmp=$(echo $tmp | tr ' ' _ | tr \" ' ')
echo $count_tmp
echo $'\n'
echo $a

if [ "9 test.txt" = "$count_tmp" ];
then 
	echo "*************" $'\n' "*********PCI  ENUMERATION - PASSED********" $'\n' "*********************"
	if [ "$current" = "$tmp" ];
	then 
	     echo "$txtgrn PCI read/write Test - Passed$txtrst"
	else echo "*************$'\n' *********PCI read/write Test - Failed******** $'\n' *********************"
	fi  
	
else echo "********" $'\n' "*********************PCI ENUMERATION - FAILED********" $'\n' "*********************"
echo $b
echo $'\n'
echo $a
fi


