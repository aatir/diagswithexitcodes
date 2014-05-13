#!/bin/sh







#

rm test.txt > /dev/null
touch test.txt
lspci | grep '.0' | cut -f 1 -d ' ' >> test.txt
count_tmp=`wc -l test.txt`

setpci=`setpci -s 0000:03:00.0 0x3C.B=aa`

dummy1=`setpci -s 0000:03:00.0 0x3C.B | tr -d ' '`
dummy1=$(echo $dummy1 | tr ' ' _ | tr \" ' ')

setpci=`setpci -s 0000:04:00.0 0x3C.B=aa`

dummy=`setpci -s 0000:04:00.0 0x3C.B | tr -d ' '`
dummy=$(echo $dummy | tr ' ' _ | tr \" ' ')

setpci=`setpci -s 0001:02:00.0 0x3C.B=aa`

current=`setpci -s 0001:02:00.0 0x3C.B | tr -d ' '`
current=$(echo $current | tr ' ' _ | tr \" ' ')

setpci=`setpci -s 0001:02:01.0 0x3C.B=aa`

tmp=`setpci -s 0001:02:01.0 0x3C.B | tr -d ' '`
tmp=$(echo $tmp | tr ' ' _ | tr \" ' ')
echo $count_tmp
echo $'\n'
echo $a

if [ "10 test.txt" = "$count_tmp" ];
then 
	echo "*************" $'\n' "*********PCI  ENUMERATION - PASSED********" $'\n' "*********************"
	if [ "$current" = "$tmp" ];
	then if [ "$dummy1" = "$dummy" ]
	then 
	     echo "$txtgrn PCI read/write Test - Passed$txtrst"
	else echo "*************$'\n' *********PCI read/write Test - Failed******** $'\n' *********************"
	 exit 1
	fi
	fi  
	
else echo "********" $'\n' "*********************PCI ENUMERATION - FAILED********" $'\n' "*********************"
 exit 1
echo $b
echo $'\n'
echo $a
fi


