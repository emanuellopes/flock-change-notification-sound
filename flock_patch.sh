#!/bin/bash

#colors
RED='\033[0;31m'
GREEN='\033[0;32m'

DIRECTORY_ASAR=/Applications/Flock.app/Contents/Resources/
FILE_ASAR=/Applications/Flock.app/Contents/Resources/app.asar
DIRECTORY_DEST_SONG=/app/hydra/hydra/src/js/hydra/notification/static/onmessage.wav
SOUND=$1 # first argument of bash script
#if [ "$EUID" -ne 0 ]
#    then echo "Please run as root!!"
#    exit
#fi

if [ ! -d "$DIRECTORY_ASAR" ]; then
  echo -e "${RED}Resources Folder not exist in flock exiting..."
  echo -e "${GREEN}How to using!"
  echo -e "${GREEN}./flock-patch.sh ~/Downloads/sound.wav"
  exit
fi

if [ ! -f "$SOUND" ]; then
  echo -e "${RED}Song directory is incorrect, exiting..."
  echo -e "${GREEN}How to using!"
  echo -e "${GREEN}./flock-patch.sh ~/Downloads/sound.wav"
  exit
fi

echo -e "${GREEN}Copying flock resources app tmp folder"
cp -rf "$FILE_ASAR" /tmp/app.asar
echo -e "${GREEN}Extract app.asar..."
asar extract /tmp/app.asar /tmp/app
echo -e "${GREEN}Copy and rewrite notification sound .wav file"
cp -rf "$SOUND" /tmp/app"$DIRECTORY_DEST_SONG"

echo -e "${GREEN}Delete old app.asar from tmp folder!"
rm -f /tmp/app.asar

echo -e "${GREEN}Compress archive..."
asar pack /tmp/app/ /tmp/app.asar

echo -e "${GREEN}Copy new app.asar to Flock application"
cp -rf /tmp/app.asar "$DIRECTORY_ASAR"

echo -e "${GREEN}cleaning tmp folder"
rm -f /tmp/app.asar
rm -rf /tmp/app

echo -e "${GREEN}Done!!! hasta la vista"
