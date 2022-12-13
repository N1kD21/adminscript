#!/bin/bash

PATHCONFBOT="/home/$SUDO_USER/source/adminscript/conf"



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
    echo "HOMEINIT -> $HOMEINIT"
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
        source $PATHCONFBOT/AdminScriptVar
        . $HOMEADMIN/controlpath.sh
        echo "SUDO_USER -> not null."
      else
       echo "SUDO_USER -> null."
       echo "Не удалось подгрузить файл конфигурации!"
       echo "Необходимо использовать sudo -s"
    fi


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
  ls -al -v ${HOMEINIT}
  ls -al -v /etc/logrotate.conf
  ls -al -v /etc/logrotate.conf_old
  crontab -l -u $USERBOT
  exit 1
}

# загружаем конфигурационный файл с настройками
loadconf

printVar

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
  	                        echo "ln -s ${HOMEINIT}/99-local.rules /etc/udev/rules.d/"
  	                        ln -v -s ${HOMEINIT}/99-local.rules /etc/udev/rules.d/
  			fi

  	                if test -f /etc/systemd/system/usb-mount@.service ;
  	                then
  	                        echo "File is empty"
  	                else
  				echo "ln -s ${HOMEINIT}/usb-mount@.service /etc/systemd/system/"
  		                ln -v -s ${HOMEINIT}/usb-mount@.service /etc/systemd/system/
  			fi

  	                if test -f /usr/local/bin/usb-mount.sh ;
  	                then
  	                        echo "File is empty"
  	                else
  		                echo "ln -s ${HOMEINIT}/usb-mount.sh /usr/local/bin/"
  		                ln -v -s ${HOMEINIT}/usb-mount.sh /usr/local/bin/
  			fi



  			# crontab
  			crontab -u $USERBOT ${HOMEINIT}/base.crontab

  			# log
  			if test -d ${HOMELOG};
  			then
          				echo "Directory is empty "
          				exit
  			else
          				mkdir -v ${HOMELOG}
					chown -v $USERBOT:$USERBOT ${HOMELOG}
          		    		echo "touch ${HOMELOG}/ngrok.log"
          				touch ${HOMELOG}/ngrok.log
          				chown -v $USERBOT:$USERBOT ${HOMELOG}/ngrok.log

          				echo "touch ${HOMELOG}/gitnodejs.log"
          				touch ${HOMELOG}/gitnodejs.log
          				chown -v $USERBOT:$USERBOT ${HOMELOG}/gitnodejs.log
  			fi

  			# rotation log
  			if test -f /etc/logrotate.conf_old ;
          then
                  echo "File is empty"
          else
          				mv /etc/logrotate.conf /etc/logrotate.conf_old
                  echo "ln -s ${HOMEINIT}/logrotate.conf /etc/logrotate.conf"
          		    ln -v -P ${HOMEINIT}/logrotate.conf /etc/logrotate.conf
          				chown -v root:root /etc/logrotate.conf
          				chmod -v 0644 /etc/logrotate.conf
  			fi
  		fi
  		# uninstall
  		if [ "$1" = "d" ] ;
        then
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


            		#del log
            		echo "rm -r ${HOMELOG}"
            		rm -r $HOMELOG

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
