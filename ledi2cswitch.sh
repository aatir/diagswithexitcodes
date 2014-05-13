#!/bin/sh
#Aatir feat. AbdurRehman

#set config register on i2c switch to make both ports output
./0x00 | eeprog /dev/i2c-0 -f 0x77 -w 0x6 
./0x00 | eeprog /dev/i2c-0 -f 0x77 -w 0x7

sleep 1
#while :
#do
# making both ports high to turn all leds off
./0xff | eeprog /dev/i2c-0 -f 0x77 -w 0x2
./0xff | eeprog /dev/i2c-0 -f 0x77 -w 0x3
#DS34
./0xff | eeprog /dev/i2c-0 -f 0x77 -w 0x2
./0xfe | eeprog /dev/i2c-0 -f 0x77 -w 0x2
sleep 1
./0xff | eeprog /dev/i2c-0 -f 0x77 -w 0x2
sleep 1

#DS30a
./0xfd | eeprog /dev/i2c-0 -f 0x77 -w 0x2
sleep 1
./0xff | eeprog /dev/i2c-0 -f 0x77 -w 0x2
sleep 1

#DS30b
./0xdf | eeprog /dev/i2c-0 -f 0x77 -w 0x2
sleep 1
./0xff | eeprog /dev/i2c-0 -f 0x77 -w 0x2
sleep 1


#DS32a
./0xfb | eeprog /dev/i2c-0 -f 0x77 -w 0x2
sleep 1
./0xff | eeprog /dev/i2c-0 -f 0x77 -w 0x2
sleep 1

#DS32b
./0xbf | eeprog /dev/i2c-0 -f 0x77 -w 0x2
sleep 1
./0xff | eeprog /dev/i2c-0 -f 0x77 -w 0x2
sleep 1

#DS33a
./0xf7 | eeprog /dev/i2c-0 -f 0x77 -w 0x2
sleep 1
./0xff | eeprog /dev/i2c-0 -f 0x77 -w 0x2
sleep 1

#DS33b
./0x7f | eeprog /dev/i2c-0 -f 0x77 -w 0x2
sleep 1
./0xff | eeprog /dev/i2c-0 -f 0x77 -w 0x2
sleep 1

#DS35a
./0xef | eeprog /dev/i2c-0 -f 0x77 -w 0x2
sleep 1
./0xff | eeprog /dev/i2c-0 -f 0x77 -w 0x2
sleep 1

#DS35b
./0xfe | eeprog /dev/i2c-0 -f 0x77 -w 0x3
sleep 1
./0xff | eeprog /dev/i2c-0 -f 0x77 -w 0x3


# making both ports high to turn all leds off
#./0xff | eeprog /dev/i2c-0 -f 0x77 -w 0x2
#./0xff | eeprog /dev/i2c-0 -f 0x77 -w 0x3


#done


