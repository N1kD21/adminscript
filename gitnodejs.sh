#!/bin/bash
echo "  "
echo "  "
echo "---------------------------------------------------------------------------------------------------------"
echo "[`date +%d-%m-%Y\ %H:%M:%S`]"
echo "/var/log/$2/crontabgitnodejs.log"


echo "systemctl status cron"
systemctl status cron

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


echo "id"
id

echo "export"
export

echo "killall node"
killall -v node


# Optionally, set default values
# var1="default value for var1"
# var1="default value for var2"
if [ $# -eq 0 ]
then
	echo "Name not provided"
else
	if [ "$1" = "t" ]; then
	       	nameFile=telegramBot
		nameDir=Module11
		export NTBA_FIX_319=1
	fi
	if [ "$1" = "v" ]; then
               	nameFile=viberBot
		nameDir=Module10
        fi
	if [ "$1" = "m" ]; then
                nameFile=messengerBot
        fi
fi

if test -f /mnt/usb-UFD_2.0_Silicon-Power16G_1108111600001358-0:0-part1/$2/etc/${nameFile}.config ;
then
	cd /home/$2/source/${nameDir}
	echo "git pull origin dev2"
	git pull origin dev2

 	. /mnt/usb-UFD_2.0_Silicon-Power16G_1108111600001358-0:0-part1/$2/etc/${nameFile}.config
	export TOKEN_DEV2="$TOKEN_DEV2"
	export TELEGRAMCHECKIN_BOT_ACCESS_TOKEN_KEY="$TELEGRAMCHECKIN_BOT_ACCESS_TOKEN_KEY"
	export TELEGRAMCHECKIN_CHANEL_ID_KEY="$TELEGRAMCHECKIN_CHANEL_ID_KEY"
	export TELEGRAMPROTOCOL_BOT_ACCESS_TOKEN_KEY="$TELEGRAMPROTOCOL_BOT_ACCESS_TOKEN_KEY"
        export TELEGRAMPROTOCOL_CHANEL_ID_KEY="$TELEGRAMPROTOCOL_CHANEL_ID_KEY"
	echo "id"
	id
	echo "node /home/$2/source/${nameDir}/main.js"
	node /home/$2/source/${nameDir}/main.js
else
	if test -f /mnt/usb-JetFlash_Transcend_4GB_H3ECYDSW-0:0-part1/$2/etc/${nameFile}.config ;
	then
        	cd /home/$2/source/${nameDir}
        	echo "git pull origin dev2"
        	git pull origin dev2\

        	. /mnt/usb-JetFlash_Transcend_4GB_H3ECYDSW-0:0-part1/$2/etc/${nameFile}.config
        	export TOKEN_DEV2="$TOKEN_DEV2"
        	export TELEGRAMCHECKIN_BOT_ACCESS_TOKEN_KEY="$TELEGRAMCHECKIN_BOT_ACCESS_TOKEN_KEY"
        	export TELEGRAMCHECKIN_CHANEL_ID_KEY="$TELEGRAMCHECKIN_CHANEL_ID_KEY"
        	export TELEGRAMPROTOCOL_BOT_ACCESS_TOKEN_KEY="$TELEGRAMPROTOCOL_BOT_ACCESS_TOKEN_KEY"
       		export TELEGRAMPROTOCOL_CHANEL_ID_KEY="$TELEGRAMPROTOCOL_CHANEL_ID_KEY"

		echo "which node"
		which node

		echo "nvm ls"
		nvm ls

		echo "node -v"
		node -v

		echo "node /home/$2/source/${nameDir}/main.js"
        	node /home/$2/source/${nameDir}/main.js
	else
		echo "____file not found" "$nameFile"
	fi
fi
