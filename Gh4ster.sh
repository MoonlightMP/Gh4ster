#!/bin/bash

#some variables
DEFAULT_ROUTE=$(ip route show default | awk '/default/ {print $3}')
IFACE=$(ip route show | awk '(NR == 2) {print $3}')
JAVA_VERSION=`java -version 2>&1 |awk 'NR==1{ gsub(/"/,""); print $3 }'`
MYIP=$(ip route show | awk '(NR == 2) {print $9}')
######## Update Kali
function updatekali {
clear
echo -e "
\033[31m\033[m
                
 ____ ___            .___       __            ____  __.      .__  .__ 
|    |   \______   __| _/____ _/  |_  ____   |    |/ _|____  |  | |__|
|    |   /\____ \ / __ |\__  \    __\/ __ \  |      < \__  \ |  | |  |
|    |  / |  |_> > /_/ | / __ \|  | \  ___/  |    |  \ / __ \|  |_|  |
|______/  |   __/\____ |(____  /__|  \___  > |____|__ (____  /____/__|
          |__|        \/     \/          \/          \/    \/         

\033[31m\033[m"
select menusel in "Update sources.list (kali sana repository for installing more package)" "Update Kali Sana 2.0 to Kali 2016.2" "Update and Clean Kali" "Back to Main"; do
case $menusel in
        "Update sources.list (Included kali sana repository for installing more package)")
                
		echo -e "\033[31m====== Adding new sources list and updating ======\033[m"
		rm /etc/apt/sources.list
		echo "" >> /etc/apt/sources.list
		echo 'deb http://http.kali.org/kali kali-rolling main non-free contrib' >> /etc/apt/sources.list
		echo 'deb-src http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list
		echo 'deb http://old.kali.org/kali sana main non-free contrib' >> /etc/apt/sources.list
		apt-get update
		pause
		clear ;;	
	"Update Kali Sana 2.0 to Kali 2016.2")
		clear
		echo -e "\033[32mUpdating Kali Sana to Kali Linux 2016.2\033[m"
		rm /etc/apt/sources.list
		echo "" >> /etc/apt/sources.list
		echo 'deb http://http.kali.org/kali kali-rolling main non-free contrib' >> /etc/apt/sources.list
		echo 'deb-src http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list
		#apt-get update && apt-get -y dist-upgrade
		apt-get update && apt-get -y upgrade 
		echo -e "\033[32mDone updating kali. You need to reboot your Kali Linux system\033[m"
		pause
		clear ;;
	
	"Update and Clean Kali")
		clear
		echo -e "\033[32mUpdating and Cleaning Kali\033[m"
		apt-get update && apt-get -y dist-upgrade && apt-get autoremove -y && apt-get -y autoclean
		echo -e "\033[32mDone updating and cleaning kali\033[m" ;;
		
	"Back to Main")
		clear
		mainmenu ;;
		
	*)
		screwup
		updatekali ;;

esac

break

done
}
########################################################
##             Main Menu Section
########################################################
function mainmenu {
echo -e "                                          
........................................
...............~~~~~::~,................
.............+::::~~~:~:::=.............
..........:?~~~::~~?:?.:~~~=?...........
.........I~~~~~~=.=~~+I,~~~~~I..........
........=~~~~+.~?~~~~~~~~~~~~+~.........
.......+====?=+=+~=====.I=~+=...........
..........+?.+?+I====I.?~===+..?........
.......+7?==+=7I7+++==+=====?..I........
........?+I++=+=7.7+++++++==~..+........
........7.?+...?++???+II+~...+77........
........,.........7I.?........7?........
........,7.......?I+7..........?........
........I7.......7.??7........,+........
.......,I......=7....7~.......7?........
........ .I?+7.=I.....II?++..7+7........
........I~====+=+.....+====++=I.........
..........:,=?=~I.....=~==?+............
..............?~?++==I==~7..............
..............+~??..?~=~~...............
..............:+===~I~=~I...............
..............=~~=?:I~::,...............
.................~~~~:,.................
........................................
........................................
\033[m                                        
          Script by Moonlight
            Version : 0.0.1 \033[32m$version\033[m
\033[32m\033[m"

select menusel in "Update Kali" "Software and System Tools" "Install Hacking Tools" "Check Gh4st-Update" "EXIT PROGRAM"; do
case $menusel in
	"Update Kali")
		updatekali
		clear ;;
	
	"Software and System Tools")
		softwaresandystemtools
		clear ;;
	
	"Install Hacking Tools")
		hackingtools 
		clear ;;	
	"Check Gh4st-Update")
		firefox https://github.com/MoonlightMP/Gh4ster
		pause
		clear ;;
	
	"EXIT PROGRAM")
		clear && exit 0 ;;
		
	* )
		screwup
		clear ;;
esac

break

done
}

while true; do mainmenu; done
