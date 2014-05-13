#!/bin/sh

mkdir /mnt/mmc > /dev/null
mount /dev/mmcblk0p1 /mnt/mmc > /dev/null
touch test.vim >/dev/null
a=$(md5sum test.vim | cut -d ' ' -f 1)

cp test.vim /mnt/mmc/test.vim
b=$(md5sum /mnt/mmc/test.vim | cut -d ' ' -f 1)
cd /
#

echo $a

echo $b
if [ $a = $b ]
	then echo "SDHCI Test - Passed"
	else echo "SDHCI Test - Failed"
fi
umount /mnt/mmc > /dev/null
rmdir /mnt/mmc > /dev/null


