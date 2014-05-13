#!/bin/sh

rm /tmp/memtest2 &> /dev/null

touch /tmp/memtest2

mount -t tmpfs -o size=400M tmpfs /tmp

dd if=/dev/urandom bs=700000 of=/tmp/memtest2 count=1



a=$(md5sum /tmp/memtest2 | cut -d ' ' -f 1)
b=$(md5sum /tmp/memtest2 | cut -d ' ' -f 1)
c=$(md5sum /tmp/memtest2 | cut -d ' ' -f 1)

#


if [ $a = $b ];
 then if [ $a = $c ];
	then echo " RAM Test - PASSED "
		while IFS=":" read -r a b
		do
		  case "$a" in
		   MemTotal*) phymem="$b"
		  esac
		done <"/proc/meminfo"
		echo $phymem
	else echo "FAILED"
	exit 1
      fi  
 
fi
