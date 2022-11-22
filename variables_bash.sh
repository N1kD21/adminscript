#!/bin/bash

# Optionally, set default values
# var1="default value for var1"
# var1="default value for var2"
if [ $# -eq 0 ]
then
	echo "Name not provided"
else
	if [ "$1" = "t" ]; then
	       nameFile=telegram
	fi
	if [ "$1" = "v" ] ; then
               nameFile=viber
        fi
	if [ "$1" = "m" ] ; then
               nameFile=messenger
        fi
fi


if test -f /mnt/KEY/$2/etc/${nameFile}.config ;
then
  	. /mnt/KEY/$2/etc/${nameFile}.config
	echo "$TOKEN_DEV2"
else
	if test -f /mnt/KEY/$2/etc/${nameFile}.config ;
	then
        	. /mnt/KEY/$2/etc/${nameFile}.config
        	echo "$TOKEN_DEV2"
	else
		echo "$var2"
	fi
fi


