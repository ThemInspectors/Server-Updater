#!/bin/bash
#
#Author: Mr_Cleric ( https://www.spigotmc.org/members/mr_cleric.83765/ )
#
#Installation:
#
#move this script into your containing directory of your spigot/bukkit server directory so if you have ~/servers/Spigot/ you would put it in your #servers directory 
#if needed put executable bit on the sh script "chmod +x ServerUpdater.sh"
#Tweak the variables
#(Optional) Install crontab if you have not. run the script from crontab.
#Note: this script assumes you have a buildtools directory if your buildtools directory is not present please make one
#
#Variables
#
#Server Version you require
SERVER_VERSION=1.9.4
#Server type ( craftbukkit/Spigot )
SERVER_TYPE=spigot
# Directory in which your buildtools is put in
BUILD_TOOLS_DIRECTORY=buildtools
#server directory
SERVER_DIRECTORY=Survival
#BungeeCord Directory
BUNGEE_DIRECTORY=bungee
#Sleep wait time until move WARNING: The server should be off at this time so if you called this at 4:30AM and your server stops at 5:00AM it would be 
#sleep time 30m , Also the server should be completely off so give one more minute also make sure the script has enough time to move the new server #jar into the directory. 30 seconds should be enough
SLEEP_TIME=31m
#Output name of the jar should be the same as the xxx.jar in your startup script
OUTPUT_NAME=Spigot.jar
#
#Advanced Variables (Edit at your own risk)
#
#BuildTools URL (with quotes)
BUILTOOLS_URL='https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar'
#BungeeCord URL with quotes
BUNGEECORD_URL='ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar'
#
#Script Body
#
#get the server jar
cd $BUILD_TOOLS_DIRECTORY
wget $BUILTOOLS_URL
java -jar BuildTools.jar --rev $SERVER_VERSION
#Rename the server jar
mv $SERVER_TYPE-$SERVER_VERSION.jar $OUTPUT_NAME.jar
# remove the buildtools jar for a new buildtools every time
rm BuildTools.jar
#Get BungeeCord
wget $BUNGECORD_URL
# go back to the begining directory
cd ..
#go to sleeeeep.....
sleep $SLEEP_TIME
#remove the old server jar
rm $SERVER_DIRECTORY/$OUTPUT_NAME
#move the new server jar
mv $BUILD_TOOLS_DIRECTORY/$OUTPUT_NAME $SERVER_DIRECTORY 
#remove old BungeeCord
rm $BUNGEE_DIRECTORY/BungeeCord.jar
#move the new one
mv $BUILD_TOOLS_DIRECTORY/BungeeCord.jar $BUNGEE_DIRECTORY
