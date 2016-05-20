#!/bin/bash
#
#set to anything but false to disable Bungee
BUNGEECORD=true
#
#Author: Mr_Cleric ( https://www.spigotmc.org/members/mr_cleric.83765/ )
#
#Variables
#
#Server Version you require
SERVER_VERSION=1.9.4
#Server type ( craftbukkit/Spigot )
SERVER_TYPE=spigot
# Directory in which your buildtools is put in
BUILD_TOOLS_DIRECTORY=buildtools
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
mv $SERVER_TYPE-$SERVER_VERSION.jar $OUTPUT_NAME
# remove the buildtools jar for a new buildtools every time
rm BuildTools.jar
#Get BungeeCord
if [ "$BUNGEECORD" = "true" ]
then
wget $BUNGEECORD_URL
# go back to the begining directory
fi
cd ..
