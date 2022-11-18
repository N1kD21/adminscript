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


if test -f /mnt/usb-UFD_2.0_Silicon-Power16G_1108111600001358-0:0-part1/$2/etc/${nameFile}.config ; 
then
  	. /mnt/usb-UFD_2.0_Silicon-Power16G_1108111600001358-0:0-part1/$2/etc/${nameFile}.config
	echo "$TOKEN_DEV2"
else
	if test -f /mnt/usb-JetFlash_Transcend_4GB_H3ECYDSW-0:0-part1/$2/etc/${nameFile}.config ; 
	then
        	. /mnt/usb-JetFlash_Transcend_4GB_H3ECYDSW-0:0-part1/$2/etc/${nameFile}.config
        	echo "$TOKEN_DEV2"
	else
		echo "$var2"
	fi
fi


