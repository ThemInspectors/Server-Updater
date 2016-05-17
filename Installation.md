Installation:


Use Linux / a Linux Emulator

have "wget" ?

move this script into your containing directory of your spigot/bukkit server directory so if you have ~/servers/Spigot/ you would put it in your servers/ directory 

if needed put executable bit on the sh script "chmod +x ServerUpdater.sh" "chmod +x File-Mover.sh"

Tweak the variables

Install crontab if you have not. run the scripts from crontab. like so...

type "crontab -e"

0 17 * * * sh ~/[server directory]/Server-Updater.sh

that gets the jars at 5pm o clock, Add this line on the bottom of your startup script

sh ~/[server directory]/File-Mover.sh

Note: this script assumes you have a buildtools directory if your buildtools directory is not present please make one
