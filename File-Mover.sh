#!/bin/bash
#
#Author: Mr_Cleric ( https://www.spigotmc.org/members/mr_cleric.83765/ )
#
#Variables
#
#Output name of the jar should be the same as the xxx.jar in your startup script
OUTPUT_NAME=Spigot.jar
#server directory
SERVER_DIRECTORY=Survival
#BungeeCord Directory
BUNGEE_DIRECTORY=bungee
#BuildTools Directory
BUILD_TOOLS_DIRECTORY=buildtools
#
#Body
#
#remove the old server jar
rm $SERVER_DIRECTORY/$OUTPUT_NAME
#move the new server jar
mv $BUILD_TOOLS_DIRECTORY/$OUTPUT_NAME $SERVER_DIRECTORY 
#remove old BungeeCord
rm $BUNGEE_DIRECTORY/BungeeCord.jar
#move the new one
mv $BUILD_TOOLS_DIRECTORY/BungeeCord.jar $BUNGEE_DIRECTORY
