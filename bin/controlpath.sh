#!/bin/bash


selectPathKey()
{
 if [ -n "$PATHFLASH" ] ;
  then
    PATHKEY=/mnt/$PATHFLASH/$USERBOT
  else
    PATHKEY=/home/$USERBOT/source/${NAMEPROJECT}/conf
  fi
}

# загружаем конфигурационный файл с настройками

selectPathKey
