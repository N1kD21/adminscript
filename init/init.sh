#!/bin/bash

PATHCONFBOT="/home/$SUDO_USER/source/adminscript/conf"



selectPathKey()
{
 if [ -n "$PATHFLASH" ] ;
  then
   PATHKEY=/mnt/$PATHFLASH/$USERBOT
  else
   PATHKEY=/home/$USERBOT/source/$NAMEPROJECT/conf
  fi
}

printVar()
{

    echo "-------------------------------"
    echo "Cодержание переменных"
    echo "USERBOT -> $USERBOT"
    echo "SUDO_USER -> $SUDO_USER"
    echo "LOGNAME -> $LOGNAME"
    echo "HOME -> $HOME"
    echo "PATHCONFBOT -> $PATHCONFBOT"
    echo "HOMEADMIN -> $HOMEADMIN"
    echo "HOMECRON -> $HOMECRON"
    echo "HOMELOG -> $HOMELOG"
    echo "PATHFLASH -> $PATHFLASH"
    echo "-------------------------------"
#    printenv
    echo "-------------------------------"
}


loadconf()
{

    echo "Загружаем переменные"
    #  указать путь, где лежит настройка
    # путь временый ~/source/adminscript/conf/

    if  [ -n "$SUDO_USER" ] ;
	then
         . $PATHCONFBOT/AdminScriptVar
         echo "SUDO_USER -> not null."
	else
	 echo "SUDO_USER -> null."
	 echo "Не удалось подгрузить файл конфигурации!"
	 echo "Необходимо использовать sudo -s"
    fi

    printVar

}

use()
{
        # testing
        echo "Name not provided. Usage $0 {i|d}"
        ls -al -v /usr/local/bin/usb-mount.sh
        ls -al -v /etc/udev/rules.d/99-local.rules
        ls -al -v /etc/systemd/system/usb-mount@.service
        ls -al -v /mnt/${PATHFLASH}
	ls -al -v ${HOMELOG}
	ls -al -v ${HOMECRON}
	ls -al -v /etc/logrotate.conf
	ls -al -v /etc/logrotate.conf_old
	crontab -l -u $USERBOT
	exit 1
}

# загружаем конфигурационный файл с настройками
loadconf

if [ $# -eq 0 ]
then
    use
else
	if  [ "$USERBOT" = "$SUDO_USER" ] && [ -n "$USERBOT" ] && [ -n "$SUDO_USER" ] ;
	then
		# install
		if [ "$1" = "i" ]; then
			#  автоматическое монтирование флешки

			echo "Установка автоматического монтирования"

			if test -f /etc/udev/rules.d/99-local.rules ;
			then
		                echo "File is empty"
			else
	                        echo "ln -s ${HOMEADMIN}/99-local.rules /etc/udev/rules.d/"
	                        ln -v -s ${HOMEADMIN}/99-local.rules /etc/udev/rules.d/
			fi

	                if test -f /etc/systemd/system/usb-mount@.service ;
	                then
	                        echo "File is empty"
	                else
				echo "ln -s ${HOMEADMIN}/usb-mount@.service /etc/systemd/system/"
		                ln -v -s ${HOMEADMIN}/usb-mount@.service /etc/systemd/system/
			fi

	                if test -f /usr/local/bin/usb-mount.sh ;
	                then
	                        echo "File is empty"
	                else
		                echo "ln -s ${HOMEADMIN}/usb-mount.sh /usr/local/bin/"
		                ln -v -s ${HOMEADMIN}/usb-mount.sh /usr/local/bin/
			fi



			# crontab
			mkdir -v ${HOMECRON}
			crontab -u $USERBOT ${HOMEADMIN}/base.crontab


	                echo "ln -s ${HOMEADMIN}/crontabconf.conf ${HOMECRON}"
	                ln -v -s ${HOMEADMIN}/crontabconf.conf ${HOMECRON}/crontabconf.conf


			#  git
	                echo "ln -s ${HOMEADMIN}/gitnodejs.sh ${HOMECRON}"
	                ln -v -s ${HOMEADMIN}/gitnodejs.sh ${HOMECRON}

			# ngrok
	                echo "ln -s ${HOMEADMIN}/ngrok.sh ${HOMECRON} "
	                ln -v -s ${HOMEADMIN}/ngrok.sh ${HOMECRON}

			# log
			if test -d ${HOMELOG};
			then
				echo "Directory is empty "
				exit
			else
				mkdir -v ${HOMELOG}

		                echo "touch ${HOMELOG}/ngrok.log"
		                #cp -v ${HOMEADMIN}/ngrok.log ${HOMELOG}
				touch ${HOMELOG}/ngrok.log
				chown $USERBOT:$USERBOT ${HOMELOG}/ngrok.log

		                #echo "cp -v  ${HOMEADMIN}/gitnodejs.log ${HOMELOG}"
		                #cp -v ${HOMEADMIN}/gitnodejs.log ${HOMELOG}
				echo "touch ${HOMELOG}/gitnodejs.log"
				touch ${HOMELOG}/gitnodejs.log
				chown $USERBOT:$USERBOT ${HOMELOG}/gitnodejs.log
			fi

			# rotation log
			if test -f /etc/logrotate.conf_old ;
	                then
	                        echo "File is empty"
	                else
				mv /etc/logrotate.conf /etc/logrotate.conf_old

				echo "ln -s ${HOMEADMIN}/logrotate.conf /etc/logrotate.conf"
		                ln -v -P ${HOMEADMIN}/logrotate.conf /etc/logrotate.conf
				chown root:root /etc/logrotate.conf
				chmod 0644 /etc/logrotate.conf
			fi
		fi
		# uninstall
		if [ "$1" = "d" ] ; then
			# отключение автоматического монтирование флешки

			echo "Удаление автоматического монтирования"

	                echo "rm /etc/udev/rules.d/99-local.rules"
	                rm -v /etc/udev/rules.d/99-local.rules

	                echo "rm /etc/systemd/system/usb-mount@.service"
	                rm -v /etc/systemd/system/usb-mount@.service

	                echo "rm /usr/local/bin/usb-mount.sh"
	                rm  -v /usr/local/bin/usb-mount.sh

			# del crontab
			echo "crontab -r"
			crontab -u $USERBOT -r

			echo "rm ${HOMECRON}"
			echo "rm -rv ${HOMECRON}"
			rm -rf ${HOMECRON}

			#del log
			echo "rm -r ${HOMELOG}"
			rm -r $HOMELOG

			#echo "rm -v ${HOMELOG}/ngrok.log"
			#rm -v ${HOMELOG}/ngrok.log

			#echo "rm -v ${HOMELOG}/gitnodejs.log"
			#rm -v ${HOMELOG}/gitnodejs.log

			#logrotate del

	                if test -f /etc/logrotate.conf_old
			then
				echo "unlink /etc/logrotate.conf"
				unlink  /etc/logrotate.conf
				mv /etc/logrotate.conf_old /etc/logrotate.conf
			fi
	       	fi
	else
		id -un
		echo "User does not match"
		exit
	fi
fi
