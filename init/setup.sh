#!/bin/bash

USERBOT=$1
WHOAMI=$(whoami)

if [ "$USERBOT" = "$WHOAMI" ];
then
        echo " Скрипт можно запускать только один раз!"
        echo " Скрипт не запускать повторно!"

	if test -d /home/$USERBOT/source;
	then
	 echo " Скрипт запускали!"
         echo " Если скрипт setup.sh запускали, то необходимо удалять пользователя!"
	 echo " Удалить пользователя: userdel -r <имя пользователя>"
	else
         echo "nvm install"
	 wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

	 mkdir -v /home/$USERBOT/source

         cd /home/$USERBOT/source
         echo "PWD -> $PWD"

         git clone https://github.com/N1kD21/adminscript.git
         ls -al /home/$USERBOT/source/adminscript
         echo " Зайти в директорию /home/$USERBOT/source/adminscript/conf и настроить файл"
	fi
else
        echo "User does not match"
	echo " Добавить пользователя: adduser <имя пользователя>"
	echo " Добавить пользователя в группу: usermod -aG sudo <имя пользователя>"
fi
