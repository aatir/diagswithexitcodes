#!/bin/sh
#modprobe sdhci-cns3xxx
mkdir -p /mnt/mmc > /dev/null
mount /dev/mmcblk0p1 /mnt/mmc &> /dev/null
detection=$(mount | grep /mnt/mmc | wc -l)
touch test.vim  &> /dev/null
a=$(md5sum test.vim | cut -d ' ' -f 1)

cp test.vim /mnt/mmc/test.vim
b=$(md5sum /mnt/mmc/test.vim | cut -d ' ' -f 1)
cd /
#
tmp='1'
#echo $a
#echo $b
#echo $detection
#echo $tmp
if [ $a = $b ]
	then if [ $detection = $tmp ]
		then echo "SDHCI Test - Passed"
		else echo "SDHCI Test - Failed"
	fi
fi
rm /mnt/mmc/test.vim &> /dev/null 
umount /mnt/mmc &> /dev/null
rmdir /mnt/mmc &> /dev/null
#rmmod sdhci-cns3xxx

