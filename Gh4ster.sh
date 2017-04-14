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

######## Install VPN
function installvpn {
	echo -e "\e[1;31mThis option will install VPN!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Installing VPN ======\033[m"
				sleep 2
				apt-get -y install network-manager-openvpn
				apt-get -y install network-manager-openvpn-gnome
				apt-get -y install network-manager-pptp
				apt-get -y install network-manager-pptp-gnome
				apt-get -y install network-manager-strongswan
				apt-get -y install network-manager-vpnc
				apt-get -y install network-manager-vpnc-gnome
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install Dirs3arch
function installDirs3arch {
if [ ! -f /opt/dirs3arch.py ]; then
	echo -e "\e[1;31mThis option will install dirs3arch!\e[0m"
	echo -e "\e[1;31mHTTP(S) directory/file brute forcer\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Installing dirs3arch ======\033[m"
				sleep 2
				git clone https://github.com/maurosoria/dirs3arch.git /opt/dirs3arch-master/
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
	else
		echo -e "\e[32m[-] Dirs3arch already installed !\e[0m"
	fi
}
######### Install VirutalBox
function installvirtualbox {

	echo -e "\e[1;31mThis option will install virtualbox!\e[0m"
	echo -e "\e[1;31mOf course, Your source.list correct!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Installing Virtualbox ======\033[m"
				sleep 2
				apt-get update && apt-get install -y linux-headers-$(uname -r)
				apt-get install virtualbox
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
#### Bleachbit Installation
function installbleachbit {
	echo -e "\e[1;31mThis option will install Bleachbit!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
	read install
	if [[ $install = Y || $install = y ]] ; then
		echo -e "\e[31m[+] Installing Bleachbit now!\e[0m"
		apt-get -y install bleachbit 
		echo -e "\e[32m[-] Done Installing Bleachbit!\e[0m"		
	else
		echo -e "\e[32m[-] Ok,maybe later !\e[0m"
	fi	
}
#### Installation GoldenDict
function installGoldendict {
	echo -e "\e[1;31mThis option will install GoldenDict!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
	read install
	if [[ $install = Y || $install = y ]] ; then
		echo -e "\e[31m[+] Installing GoldenDict now!\e[0m"
		apt-get -y install goldendict 
		echo -e "\e[32m[-] Done Installing goldendict!\e[0m"		
	else
		echo -e "\e[32m[-] Ok,maybe later !\e[0m"
	fi	
}
######## Install Pinta
function installpinta {
	echo "This will install Pinta (image editor). Do you want to install it ? (Y/N)"
	read install
	if [[ $install = Y || $install = y ]] ; then
		echo -e "\e[31m[+] Installing Pinta now!\e[0m"
		apt-get -y install pinta
		echo -e "\e[32m[-] Done Installing Pinta!\e[0m"		
	else
		echo -e "\e[32m[-] Ok,maybe later !\e[0m"
	fi
	
	
}
######## Install ibus
function installibus {
	echo "This will install ibus. Do you want to install it ? (Y/N)"
	read install
	if [[ $install = Y || $install = y ]] ; then
		echo -e "\e[31m[+] Installing ibus now!\e[0m"
		apt-get -y install ibus && apt-get -y install ibus-unikey
		echo -e "\e[32m[-] Done Installing ibus!\e[0m"		
	else
		echo -e "\e[32m[-] Ok,maybe later !\e[0m"
	fi
	
	
}
######## Install libreoffice
function installlibreoffice {
	echo "This will install libreoffice. Do you want to install it ? (Y/N)"
	read install
	if [[ $install = Y || $install = y ]] ; then
		echo -e "\e[31m[+] Installing libreoffice now!\e[0m"
		apt-get -y install libreoffice
		echo -e "\e[32m[-] Done Installing libreoffice!\e[0m"		
	else
		echo -e "\e[32m[-] Ok,maybe later !\e[0m"
	fi
	
	
}
######## Install knotes
function installknotes {
	echo "This will install knotes. Do you want to install it ? (Y/N)"
	read install
	if [[ $install = Y || $install = y ]] ; then
		echo -e "\e[31m[+] Installing knotes now!\e[0m"
		apt-get -y install knotes
		echo -e "\e[32m[-] Done Installing knotes!\e[0m"		
	else
		echo -e "\e[32m[-] Ok,maybe later !\e[0m"
	fi
	
	
}
# JAVA JDK Update
#################################################################################
######## Install Java version 8
function installjava {
	echo -e "\e[1;31mThis option will install java!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Installing Java ======\033[m"
				sleep 2
				echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
				echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
				apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
				apt-get update
				apt-get -y install oracle-java8-installer
				echo -e "\033[32m====== Done Installing ======\033[m"
				echo -e "\033[32mTo remove java version 1.8\033[m"
				echo -e "\033[32mapt-get --purge remove oracle-java8-installer\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install Sopcast
function installsopcast {
	echo -e "\e[1;31mThis option will install sopcast!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Installing Sopcast ======\033[m"
				sleep 2
				wget https://launchpad.net/~jason-scheunemann/+archive/ppa/+files/sp-auth_3.2.6~ppa1~precise3_i386.deb
				dpkg -i sp-auth_3.2.6~ppa1~precise3_*.deb
				apt-get -f install
				wget https://launchpad.net/~jason-scheunemann/+archive/ppa/+files/sopcast-player_0.8.5~ppa~precise1_i386.deb
				dpkg -i sopcast-player_0.8.5~ppa~precise1_*.deb
				apt-get -f install
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install Veil-Framework
function installveil {
if [ ! -f /opt/BypassAV/Veil-Evasion/Veil-Evasion.py ]; then
	echo -e "\e[1;31mThis option will install Veil-Evasion!\e[0m"
	echo -e "\e[1;31mHow to use Veil-Evasopm\e[0m"
	echo -e "\e[1;32mhttps://www.youtube.com/watch?v=8Z4gBKE6i-c\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Installing Veil-Evasion ======\033[m"
				sleep 2
				git clone https://github.com/Veil-Framework/Veil-Evasion.git /opt/BypassAV/Veil-Evasion/
				cd /opt/BypassAV/Veil-Evasion/setup
				./setup.sh -s
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
	else
		echo -e "\e[32m[-] Veil-Evasion already installed !\e[0m"
	fi
}
######## Install VPN-BOOK
function installvpnbook {
if [ ! -f /root/Desktop/vpnbook.sh ]; then
	echo -e "\e[1;31mThis option will install VPN-BOOK!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Installing VPN-BOOK ======\033[m"
				sleep 2
				cd /root/Desktop
				wget https://github.com/Top-Hat-Sec/thsosrtl/blob/master/VeePeeNee/VeePeeNee.sh
				mv VeePeeNee.sh vpnbook.sh
				chmod a+x vpnbook.sh
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
	else
		echo -e "\e[32m[-] VPN-BOOK already installed !\e[0m"
	fi
}

######## Install Tor Browser
function installtorbrowser {
if [ ! -f /root/tor-browser_en-US/Browser/start_tor_browser ]; then
	echo -e "\e[1;31mThis option will install Tor Browser!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Installing Tor Browser ======\033[m"
				sleep 2
				cd /root/Desktop
				wget https://www.torproject.org/dist/torbrowser/4.5.3/tor-browser-linux32-4.5.3_en-US.tar.xz
				tar -xf tor-browser-linux32-4.5.3_en-US.tar.xz
				cd /root/Desktop/tor-browser_en-US/Browser/
				mv start-tor-browser start-tor-browser.txt
				sed -i 's/`id -u`" -eq 0/`id -u`" -eq 1/g' start-tor-browser.txt
				mv start-tor-browser.txt start-tor-browser
				cd ..
				ls -ld
				chown -R root:root .
				ls -ld
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
	else
		echo -e "\e[32m[-] Tor Browser already installed !\e[0m"
	fi
}

######## Install Archive-Manager
function installarchivemanager {
	echo -e "\e[1;31mThis option will install Archive Manager!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Installing Archive Manager ======\033[m"
				sleep 2
				apt-get -y install unrar unace rar unrar p7zip zip unzip p7zip-full p7zip-rar file-roller
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install Gdebi
function installgdebi {
	echo -e "\e[1;31mThis option will install Gdebi!\e[0m"
	echo -e "\e[1;31mgdebi lets you install local deb packages resolving and installing its dependencies. apt does the same, but only for remote (http, ftp) located packages.!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Installing Gdebi ======\033[m"
				sleep 2
				apt-get -y install gdebi &>/dev/nul
				echo -e "\033[32m====== Done Installing Gdebi ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install bittorrent client
function installbittorrent {
	echo -e "\e[1;31mThis option will install bittorrent!\e[0m"
	echo -e "\e[1;31mThis is a transitional dummy package to ensure clean upgrades from old releases (the package deluge-torrent is replaced by deluge)!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Installing bittorrent ======\033[m"
				sleep 2
				apt-get -y install deluge-torrent &>/dev/null
				echo -e "\033[32m====== Done Installing bittorrent ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install Fix Sound Mute
function installfixsoundmute {
	echo -e "\e[1;31mThis option will fix sound mute on Kali Linux on boot!\e[0m"
	echo -e ""
	echo -e "Do you want to install alsa-utils to fix it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Fixing sound mute ======\033[m"
				sleep 2
				apt-get -y install alsa-utils &>/dev/null
				echo -e "\033[32m====== Done Installing alsa-utils ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}

######## Install Firefox
function installfirefox {
	echo -e "\e[1;31mThis option will install Firefox!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Installing Firefox ======\033[m"
				sleep 2
				apt-get -y remove iceweasel
				echo -e deb http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt all main | tee -a /etc/apt/sources.list > /dev/null
				apt-key adv –recv-keys –keyserver keyserver.ubuntu.com C1289A29
				apt-get update
				apt-get --force-yes install firefox-mozilla-build				
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install VLC
function installvlc {
	echo -e "\e[1;31mThis option will fix VLC error!\e[0m"
	echo -e ""
	echo -e "Do you want to fix it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Fixing VLC ======\033[m"
				sleep 2
				sed -i 's/geteuid/getppid/g' /usr/bin/vlc				
				echo -e "\033[32m====== Done Fixing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install Vmware
function installvmware {
	echo -e "\e[1;31mThis option will fix VMare error!\e[0m"
	echo -e ""
	echo -e "Do you want to fix it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Fixing VMWare ======\033[m"
				sleep 2
				cd /usr/lib/vmware/modules/source
 				tar -xvf vmnet.tar			
				mv vmnet-only/netif.c vmnet-only/netif.txt
				sed -i 's/`dev = alloc_netdev(sizeof *netIf, deviceName, VNetNetIfSetup)" -eq dev = alloc_netdev(sizeof *netIf, deviceName, NET_NAME_UNKNOWN, VNetNetIfSetup)/g' vmnet-only/netif.txt
				mv vmnet-only/netif.txt vmnet-only/netif.c	
				tar -cvf vmnet.tar vmnet-only/
				rm -rf vmnet-only/
				echo -e "\033[32m====== Done Fixing ======\033[m"
				echo -e "\033[32m====== If it doesn't work, please view video below ======\033[m"				
				echo -e "\033[32m====== https://www.youtube.com/watch?v=qH3OSBAMNA4 ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Software and System Tools menu
function softwaresandystemtools {
clear
echo -e "
\033[31m\033[m
\033[31m
╔═╗┌─┐┌─┐┌┬┐┬ ┬┌─┐┬─┐┌─┐   ┬   ╔═╗┬ ┬┌─┐┌┬┐┌─┐┌┬┐  ╔╦╗┌─┐┌─┐┬  ┌─┐
╚═╗│ │├┤  │ │││├─┤├┬┘├┤   ┌┼─  ╚═╗└┬┘└─┐ │ ├┤ │││   ║ │ ││ ││  └─┐
╚═╝└─┘└   ┴ └┴┘┴ ┴┴└─└─┘  └┘   ╚═╝ ┴ └─┘ ┴ └─┘┴ ┴   ╩ └─┘└─┘┴─┘└─┘  
\033[m              
\033[31m\033[m"
select menusel in "VPN" "VPN-BOOK" "VirtualBox" "Bleachbit" "Sopcast" "GoldenDict" "Java" "Pinta" "ibus" "libreoffice" "knotes" "Tor Browser" "Fix Sound Mute" "Archive-Manager" "Gdebi" "bittorrent client" "Fix VMWare" "Fix VLC" "Firefox" "Install All" "Back to Main"; do
case $menusel in
		"VPN")
		installvpn
		pause
		softwaresandystemtools ;;
	"VPN-BOOK")
		installvpnbook
		pause
		softwaresandystemtools ;;
		"VirtualBox")
		installvirtualbox
		pause
		softwaresandystemtools ;;

	"Fix VMWare")
		installvmware
		pause
		softwaresandystemtools ;;
		
	"Fix VLC")
		installvlc
		pause
		softwaresandystemtools ;;

	"Sopcast")
		installsopcast
		pause
		softwaresandystemtools ;;

	"Firefox")
		installfirefox
		pause
		softwaresandystemtools ;;
		
	"Bleachbit")
		installbleachbit
		pause
		softwaresandystemtools ;;
	
	"GoldenDict")
		installGoldendict
		pause
		softwaresandystemtools ;;
		
		
	"Java")
		installjava
		pause
		softwaresandystemtools ;;
		
	"Pinta")
		installpinta
		pause
		softwaresandystemtools ;;
	
	"ibus")
		installibus
		pause
		softwaresandystemtools ;;
	"libreoffice")
		installlibreoffice
		pause
		softwareandsystemtools ;;
	"knotes")
		installknotes
		pause
		softwaresandystemtools ;;
	"Tor Browser")
		installtorbrowser
		pause
		softwaresandystemtools ;;
	"Fix Sound Mute")
		installfixsoundmute
		pause
		softwaresandystemtools ;;
	"Archive-Manager")
		installarchivemanager
		pause
		softwaresandystemtools ;;
	"Gdebi")
		installgdebi
		pause
		softwaresandystemtools ;;
	"bittorrent client")
		installbittorrent
		pause
		softwaresandystemtools ;;

	"Fix VLC")
		installvlc
		pause
		softwaresandystemtools ;;

	
	"Install All")
		echo -e "\e[36mJava is install seperately choose it from the Software and System Tools menu\e[0m"
		installvirtualbox
		installbleachbit
		installGoldendict
		installpinta
		installgnometweaktool
		installibus
		installlibreoffice
		installknotes
		installvpnbook
		installvpn
		installtorbrowser
		installfixsoundmute
		installarchivemanager
		installgdebi
		installbittorrent
		
		echo -e "\e[32m[-] Done Installing Software and System Tools\e[0m"
		pause
		softwaresandystemtools ;;

	"Back to Main")
		clear
		mainmenu ;;
		
	*)
		screwup
		softwaresandystemtools ;;
	
		
esac

break

done
}

######## Install masscan
function installmasscan {
	echo -e "\e[1;31mThis option will install masscan!\e[0m"
	echo -e "\e[1;31mTCP port scanner, spews SYN packets asynchronously, scanning entire Internet in under 5 minutes.\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m 
╦┌┐┌┌─┐┌┬┐┌─┐┬  ┬  ┬┌┐┌┌─┐  ╔╦╗┌─┐┌─┐┌─┐┌─┐┌─┐┌┐┌
║│││└─┐ │ ├─┤│  │  │││││ ┬  ║║║├─┤└─┐└─┐│  ├─┤│││
╩┘└┘└─┘ ┴ ┴ ┴┴─┘┴─┘┴┘└┘└─┘  ╩ ╩┴ ┴└─┘└─┘└─┘┴ ┴┘└┘                                                                                    
				\033[m"
				sleep 2
				rm -rf /opt/intelligence-gathering/Network/masscan/
				git clone https://github.com/robertdavidgraham/masscan.git /opt/intelligence-gathering/Network/masscan/
				cd /opt/intelligence-gathering/Network/masscan/
				apt-get -y install git gcc make libpcap-dev
				make
				cd bin/
				cp masscan /usr/bin/
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}

######## Install Morpheus  
function installmorpheus {
if [ ! -f /usr/share/morpheus ]; then
echo -e "\e[1;31mThis option will install Morpheus!\e[0m"
echo -e ""
	echo -e "Do you want to install it ? (Y/N)"


read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
╦┌┐┌┌─┐┌┬┐┌─┐┬  ┬  ┬┌┐┌┌─┐  ╔╦╗┌─┐┬─┐┌─┐┬ ┬┌─┐┬ ┬┌─┐  
║│││└─┐ │ ├─┤│  │  │││││ ┬  ║║║│ │├┬┘├─┘├─┤├┤ │ │└─┐  
╩┘└┘└─┘ ┴ ┴ ┴┴─┘┴─┘┴┘└┘└─┘  ╩ ╩└─┘┴└─┴  ┴ ┴└─┘└─┘└─┘  
				\033[m"
				sleep 2
				git clone https://github.com/r00t-3xp10it/morpheus /usr/share/morpheus
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
	else
		echo -e "\e[32m[-] Morpheus already installed !\e[0m"
	fi
}
######## Install bettercap
function installbettercap {
	echo -e "\e[1;31mThis option will install bettercap!\e[0m"
	echo -e "\e[1;31mA complete, modular, portable and easily extensible MITM framework.\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
╦┌┐┌┌─┐┌┬┐┌─┐┬  ┬  ┬┌┐┌┌─┐  ┌┐ ┌─┐┌┬┐┌┬┐┌─┐┬─┐┌─┐┌─┐┌─┐
║│││└─┐ │ ├─┤│  │  │││││ ┬  ├┴┐├┤  │  │ ├┤ ├┬┘│  ├─┤├─┘
╩┘└┘└─┘ ┴ ┴ ┴┴─┘┴─┘┴┘└┘└─┘  └─┘└─┘ ┴  ┴ └─┘┴└─└─┘┴ ┴┴  
				\033[m"
				sleep 2
				rm -rf /opt/Sniffing-Spoofing/bettercap/
				git clone https://github.com/evilsocket/bettercap /opt/Sniffing-Spoofing/bettercap/
				apt-get install bettercap
				apt-get install ruby-dev libpcap-dev
				cd /opt/Sniffing-Spoofing/bettercap/
				gem build bettercap.gemspec
				sudo gem install bettercap*.gem
				gem update bettercap
				echo -e "\e[32m[-] Done Installing!\e[0m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install seclist
function installseclist {
	echo -e "\e[1;31mThis option will install seclist!\e[0m"
	echo -e "\e[1;31m  \e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
╦┌┐┌┌─┐┌┬┐┌─┐┬  ┬  ┬┌┐┌┌─┐  ╔═╗┌─┐┌─┐┬  ┬┌─┐┌┬┐
║│││└─┐ │ ├─┤│  │  │││││ ┬  ╚═╗├┤ │  │  │└─┐ │ 
╩┘└┘└─┘ ┴ ┴ ┴┴─┘┴─┘┴┘└┘└─┘  ╚═╝└─┘└─┘┴─┘┴└─┘ ┴ 
				\033[m"
				sleep 2
				rm -rf /opt/intelligence-gathering/seclist/
				git clone https://github.com/danielmiessler/SecLists.git /opt/intelligence-gathering/seclist/
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install Fluxion
function installfluxion {
if [ ! -f /opt/wireless/fluxion ]; then
	echo -e "\e[1;31mThis option will install Fluxion!\e[0m"
	echo -e "\e[1;31mEvil Twin wireless attacking method\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
╦┌┐┌┌─┐┌┬┐┌─┐┬  ┬  ┬┌┐┌┌─┐  ╔═╗┬  ┬ ┬─┐ ┬┬┌─┐┌┐┌
║│││└─┐ │ ├─┤│  │  │││││ ┬  ╠╣ │  │ │┌┴┬┘││ ││││
╩┘└┘└─┘ ┴ ┴ ┴┴─┘┴─┘┴┘└┘└─┘  ╚  ┴─┘└─┘┴ └─┴└─┘┘└┘
				\033[m"
				sleep 2
				git clone https://github.com/deltaxflux/fluxion.git /opt/wireless/fluxion
				cd /opt/wireless/fluxion
				chmod +x Installer.sh
				./Installer.sh
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
	else
		echo -e "\e[32m[-] Fluxion already installed !\e[0m"
	fi
}


######## Install mitmf
function installmitmf {
if [ ! -f /opt/MITMf-master/mitmf.py ]; then
	echo -e "\e[1;31mThis option will install mitmf!\e[0m"
	echo -e "\e[1;31mFramework for Man-In-The-Middle attacks\e[0m"
	echo -e "\e[1;31mDefeat HTST to get HTTPS password\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
╦┌┐┌┌─┐┌┬┐┌─┐┬  ┬  ┬┌┐┌┌─┐  ╔╦╗┬┌┬┐┌┬┐┌─┐
║│││└─┐ │ ├─┤│  │  │││││ ┬  ║║║│ │ │││├┤ 
╩┘└┘└─┘ ┴ ┴ ┴┴─┘┴─┘┴┘└┘└─┘  ╩ ╩┴ ┴ ┴ ┴└  
				\033[m"
				sleep 2
				rm -rf /opt/Sniffing-Spoofing/mitmf/
				git clone https://github.com/byt3bl33d3r/MITMf.git /opt/Sniffing-Spoofing/mitmf/
				cd  /opt/Sniffing-Spoofing/mitmf/
				./setup.sh
				apt-get -y install python-dev python-setuptools libpcap0.8-dev libnetfilter-queue-dev
				pip install --upgrade -r requirements.txt
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
	else
		echo -e "\e[32m[-] autopwn already installed !\e[0m"
	fi
}


######### Install Hacking Tools
function hackingtools {
clear
echo -e "
\033[31m\033[m
\033[36m                
  ____.  .____         ___________           .__          
 |_   |  |   _|        \__    ___/___   ____ |  |   ______
   |  |  |  |     ______ |    | /  _ \ /  _ \|  |  /  ___/
   |  |  |  |    /_____/ |    |(  <_> |  <_> )  |__\___ \ 
  _|  |  |  |_           |____| \____/ \____/|____/____  >
 |____|  |____|                                        \/ 


\033[36m
\033[31m\033[m"

select menusel in   "Masscan" "Morpheus" "bettercap" "seclist" "Install All" "Back to Main"; do
case $menusel in 

 "Masscan")
		installmasscan
		pause 
		hackingtools ;;

"Morpheus")
		installmorpheus
		pause
		hackingtools ;;

"bettercap")
		installbettercap
		pause
		hackingtools ;;

 "seclist")
		installseclist
		pause
		hackingtools ;;

 "Fluxion")
		installfluxion
		pause
		hackingtools ;;

 "mitmf")
		installmitmf
		pause 
		hackingtools ;;

 "Install All")
    installmasscan
    installmorpheus
    installbettercap 
    installseclist
    installfluxion
    installmitmf
	echo -e "\e[32m[-] Done Installing hackingtools\e[0m"
		pause
		extras ;;
		

	"Back to Main")
		clear
		mainmenu ;;
		
	*)
		screwup
		extras ;;
	
		
esac

break

done
}

#### pause function
function pause(){
   read -sn 1 -p "Press any key to continue..."
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
            Version : 0.0.6 \033[32m$version\033[m
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
