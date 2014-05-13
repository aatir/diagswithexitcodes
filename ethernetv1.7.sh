#!/bin/sh
ifconfig eth0 192.168.1.111
ifconfig eth1 192.168.1.112
ifconfig eth2 192.168.1.114
ipaddr="192.168.1.103"


a="2 packets transmitted, 2 packets received, 0% packet loss"
echo "$1"
echo " "
echo "$2"
if [ "$1" = "0" ]
then
        b=`ping -c 2 -q $2 | grep packets | cut -d ] -f 2`
        if [ "$a" = "$b" ]
        then
                echo " ETHERNET TEST - PASSED [ETH0 given Passed on ETH0] "
        else
                c=`ping -I eth1 -c 2 -q $2 | grep packets | cut -d ] -f 2`
                if [ "$a" = "$c" ]
                then
                        echo " ETHERNET TEST - PASSED [ETH0 given Passed on ETH1] "
                        else
                        d=`ping -I eth2 -c 2 -q $2 | grep packets | cut -d ] -f 2`
                        if [ "$a" = "$d" ]
                        then
                                echo " ETHERNET TEST - PASSED [ETH0 given Passed on ETH2] "
                                else echo "ETHERNET TEST - FAILED"
                        fi
                fi
        fi
 else

        if [ "$1" = "1" ]
        then
                b=`ping -I eth1 -c 2 -q $2 | grep packets | cut -d ] -f 2`
                if [ "$a" = "$b" ]
                then
                        echo " ETHERNET TEST - PASSED [ETH1 given Passed on ETH1] "
                else
                        c=`ping -I eth2 -c 2 -q $2 | grep packets | cut -d ] -f 2`
                        if [ "$a" = "$c" ]
                        then
                                echo " ETHERNET TEST - PASSED [ETH1 given Passed on ETH2] "
                                else
                                d=`ping  -c 2 -q $2 | grep packets | cut -d ] -f 2`
                                if [ "$a" = "$d" ]
                                then
                                echo " ETHERNET TEST - PASSED [ETH1 given Passed on ETH0] "
                                else echo "ETHERNET TEST - FAILED"
                                fi
                        fi
                fi
        else
                if [ "$1" = "2" ]
                        then
                                b=`ping -I eth2 -c 2 -q $2 | grep packets | cut -d ] -f 2`
                                if [ "$a" = "$b" ]
                                then
                                        echo " ETHERNET TEST - PASSED [ETH2 given Passed on ETH2] "
                                else
                                        c=`ping -c 2 -q $2 | grep packets | cut -d ] -f 2`
                                        if [ "$a" = "$c" ]
                                        then
                                                echo " ETHERNET TEST - PASSED [ETH2 given Passed on ETH0] "
                                        else
                                        d=`ping -I eth1 -c 2 -q $2 | grep packets | cut -d ] -f 2`
                                        if [ "$a" = "$d" ]
                                        then
                                        echo " ETHERNET TEST - PASSED [ETH2 given Passed on ETH1] "
                                        else echo "ETHERNET TEST - FAILED"
                                        fi
                                fi
                fi
                else echo "Interface argument missing "
                fi
     fi
fi









#
