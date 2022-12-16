#!/bin/bash


selectPathKey()
{
 if [ -n "$PATHFLASH" ] ;
  then
    export PATHKEY="/mnt/$PATHFLASH/$USERBOT"
  else
    export PATHKEY="/home/$USERBOT/source/${NAMEPROJECT}/conf"
  fi
}

# загружаем конфигурационный файл с настройками

selectPathKey

echo "просто PATHKEY -> $PATHKEY"
echo "PATHFLASH -> $PATHFLASH"
