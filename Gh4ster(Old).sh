#!/bin/bash

#some variables
DEFAULT_ROUTE=$(ip route show default | awk '/default/ {print $3}')
IFACE=$(ip route show | awk '(NR == 2) {print $3}')
JAVA_VERSION=`java -version 2>&1 |awk 'NR==1{ gsub(/"/,""); print $3 }'`
MYIP=$(ip route show | awk '(NR == 2) {print $9}')

#Colors() {
#Escape="\033";
#  white="${Escape}[0m";
#  RedF="${Escape}[31m";
#  GreenF="${Escape}[32m";
#  YellowF="${Escape}[33m";
#  BlueF="${Escape}[34m";
#  CyanF="${Escape}[36m";
#Reset="${Escape}[0m";
#}
# color-echo.sh:
black='\E[30;47m'
red='\E[31;47m'
green='\E[32;47m'
yellow='\E[33;47m'
blue='\E[34;47m'
magenta='\E[35;47m'
cyan='\E[36;47m'
white='\E[37;47m'

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
		echo -e "\033[32m
╦ ╦┌─┐┌┬┐┌─┐┌┬┐┬┌┐┌┌─┐  ┌─┐┌┐┌┌┬┐  ╔═╗┬  ┌─┐┌─┐┌┐┌┬┌┐┌┌─┐  ╦╔═┌─┐┬  ┬
║ ║├─┘ ││├─┤ │ │││││ ┬  ├─┤│││ ││  ║  │  ├┤ ├─┤││││││││ ┬  ╠╩╗├─┤│  │
╚═╝┴  ─┴┘┴ ┴ ┴ ┴┘└┘└─┘  ┴ ┴┘└┘─┴┘  ╚═╝┴─┘└─┘┴ ┴┘└┘┴┘└┘└─┘  ╩ ╩┴ ┴┴─┘┴
		\033[m"
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

function Desktopmanager {
clear
echo -e "
\033[31m\033[m
     
  ╔═╗┬ ┬┌─┐┌┐┌┌─┐┌─┐  ╦╔═┌─┐┬  ┬  ╔╦╗┌─┐┌─┐┬┌─┌┬┐┌─┐┌─┐  ╔╦╗┌─┐┌┐┌┌─┐┌─┐┌─┐┬─┐
  ║  ├─┤├─┤││││ ┬├┤   ╠╩╗├─┤│  │   ║║├┤ └─┐├┴┐ │ │ │├─┘  ║║║├─┤│││├─┤│ ┬├┤ ├┬┘
  ╚═╝┴ ┴┴ ┴┘└┘└─┘└─┘  ╩ ╩┴ ┴┴─┘┴  ═╩╝└─┘└─┘┴ ┴ ┴ └─┘┴    ╩ ╩┴ ┴┘└┘┴ ┴└─┘└─┘┴└─
\033[31m\033[m"
select menusel in "XFCE Desktop" "KDE Desktop" "LXDE Desktop" "Conky" "Back to Main"; do
case $menusel in
        "XFCE Desktop")
                
		echo -e "\033[32m
                                                                 
                      _____        _____        ______   
_____      _____ ____|\    \   ___|\    \   ___|\     \  
\    \    /    /|    | \    \ /    /\    \ |     \     \ 
 \    \  /    / |    |______/|    |  |    ||     ,_____/|
  \____\/____/  |    |----'\ |    |  |____||     \--'\_|/
  /    /\    \  |    |_____/ |    |   ____ |     /___/|  
 /    /  \    \ |    |       |    |  |    ||     \____|\ 
/____/ /\ \____\|____|       |\ ___\/    /||____ '     /|
|    |/  \|    ||    |       | |   /____/ ||    /_____/ |
|____|    |____||____|        \|___|    | /|____|     | /
  \(        )/    )/            \( |____|/   \( |_____|/ 
   '        '     '              '   )/       '    )/    

		\033[m"
		apt-get install kali-defaults kali-root-login desktop-base xfce4 xfce4-places-plugin xfce4-goodies
		echo xfce4-session > /root/.xsession
		echo -e "\033[32mDone Installing\033[m"
		pause
		clear ;;	
	"KDE Desktop")

		echo -e "\033[32m
                                          
 ____    ____       _____        ______   
|    |  |    |  ___|\    \   ___|\     \  
|    |  |    | |    |\    \ |     \     \ 
|    | /    // |    | |    ||     ,_____/|
|    |/ _ _//  |    | |    ||     \--'\_|/
|    |\    \'  |    | |    ||     /___/|  
|    | \    \  |    | |    ||     \____|\ 
|____|  \____\ |____|/____/||____ '     /|
|    |   |    ||    /    | ||    /_____/ |
|____|   |____||____|____|/ |____|     | /
  \(       )/    \(    )/     \( |_____|/ 
   '       '      '    '       '    )/    
                                    ' 
                                                         
		\033[m"
		apt-get install kali-defaults kali-root-login desktop-base kde-plasma-desktop
		echo -e "\033[32mDone Installing\033[m"
		pause
		clear ;;
	"LXDE Desktop")
		echo -e "\033[32m
                                                        
 ____                             _____        ______   
|    |       _____      _____ ___|\    \   ___|\     \  
|    |       \    \    /    /|    |\    \ |     \     \ 
|    |        \    \  /    / |    | |    ||     ,_____/|
|    |  ____   \____\/____/  |    | |    ||     \--'\_|/
|    | |    |  /    /\    \  |    | |    ||     /___/|  
|    | |    | /    /  \    \ |    | |    ||     \____|\ 
|____|/____/|/____/ /\ \____\|____|/____/||____ '     /|
|    |     |||    |/  \|    ||    /    | ||    /_____/ |
|____|_____|/|____|    |____||____|____|/ |____|     | /
  \(    )/     \(        )/    \(    )/     \( |_____|/ 
   '    '       '        '      '    '       '    )/   

		\033[m"
		apt-get install lxde-core lxde kali-defaults kali-root-login desktop-base
		echo -e "\033[32mDone Installing\033[m"
		pause
		clear ;;
	"Conky")
		chmod a+x conky.sh
		./conky.sh
		pause
		clear ;;
		
		
	"Back to Main")
		clear
		mainmenu ;;
		
	*)
		screwup
		Desktopmanager ;;

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
				echo -e "\e[32m[-] As You Wish !\e[0m"
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
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
		echo -e "\e[32m[-] As You Wish !\e[0m"
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
		echo -e "\e[32m[-] As You Wish !\e[0m"
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
		echo -e "\e[32m[-] As You Wish !\e[0m"
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
		echo -e "\e[32m[-] As You Wish !\e[0m"
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
		echo -e "\e[32m[-] As You Wish !\e[0m"
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
		echo -e "\e[32m[-] As You Wish !\e[0m"
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
}
######## Install Veil-Framework
function installveil {
if [ ! -f /opt/BypassAV/Veil-Evasion/Veil-Evasion.py ]; then
	echo -e "\e[1;31mThis option will install Veil-Evasion!\e[0m"
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
	else
		echo -e "\e[32m[-] Tor Browser already installed !\e[0m"
	fi
}

# Install Chromium
function installchromium {
  getggrep="/etc/apt/sources.list.d/google.list"
  showlogo
  echo -e " Preparing To Install ${b}Chromium${enda}" && echo
  echo -e " ${bu}Chromium is an open-source browser project that aims to build
 a safer, faster, and more stable way for all Internet
 users to experience the web. This site contains design
 documents, architecture overviews, testing information,
 and more to help you learn to build and work with the
 Chromium source code.
 Read more about it here: ${b}http://www.chromium.org/Home${enda}"
  echo && echo -en " ${y}Press Enter To Continue${endc}"
  read input
  echo -e " Installing ${b}Chromium${enda}"
  if [[ -d $getggrep ]]; then
    echo -e " ${b}Google Linux Repository${enda} status: ${g}Installed${endc}"
    xterm -e apt-get install chromium
    xterm -e wget http://sourceforge.net/projects/kaais/files/Custom_Files/chromium -O /usr/bin/chromium
  else
    echo -e " ${b}Google Linux Repository${enda} status: ${r}Not Found${endc}"
    echo -e " Installing ${b}Google Linux Repository${enda}"
      xterm -e "wget -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -"
      xterm -e sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
      xterm -e apt-get update
    echo -e " ${b}Google Linux Repository${enda} is now installed"
    xterm -e apt-get install chromium
    xterm -e wget http://sourceforge.net/projects/kaais/files/Custom_Files/chromium -O /usr/bin/chromium
  fi
  echo -e " ${b}Chromium${enda} Was Successfully Installed"
  echo && echo -e " Run Chromium From The ${b}Internet${enda} Menu"
  echo && echo -en " ${y}Press Enter To Return To Menu${endc}"
  read input
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
}

# Install Google Chrome
function installchrome {
  getggrep="/etc/apt/sources.list.d/google.list"
  showlogo
  echo -e " Preparing To Install ${b}Chrome${enda}" && echo
  echo -e " ${bu}Google Chrome is a freeware web browser developed by Google.
 It used the WebKit layout engine until version 27 and,
 with the exception of its iOS releases, from version 28
 and beyond uses the WebKit fork Blink.
 Read more about it here: ${b}https://www.google.com/chrome/${enda}"
  echo && echo -en " ${y}Press Enter To Continue${endc}"
  read input
  echo -e " Installing ${b}Chrome${enda}"
  if [[ -d $getggrep ]]; then
    echo -e " ${b}Google Linux Repository${enda} status: ${g}Installed${endc}"
    xterm -e apt-get -y install google-chrome-stable
    xterm -e wget http://sourceforge.net/projects/kaais/files/Custom_Files/google-chrome -O /opt/google/chrome/google-chrome
  else
    echo -e " ${b}Google Linux Repository${enda} status: ${r}Not Found${endc}"
    echo -e " Installing ${b}Google Linux Repository${enda}"
      xterm -e "wget -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -"
      xterm -e sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
      xterm -e apt-get update
    echo -e " ${b}Google Linux Repository${enda} is now installed"
    xterm -e apt-get -y install google-chrome-stable
    xterm -e wget http://sourceforge.net/projects/kaais/files/Custom_Files/google-chrome -O /opt/google/chrome/google-chrome
  fi
  echo -e " ${b}Chrome${enda} Was Successfully Installed"
  echo && echo -e " Run Chrome From The ${b}Internet${enda} Menu"
  echo && echo -en " ${y}Press Enter To Return To Menu${endc}"
  read input
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
}

# Install Youtube Downloader
function installytbdwn {
  #showlogo
  echo -e " Preparing To Install ${b}Youtube Downloader${enda}" && echo
  echo -e " ${bu}Simple Youtube Video Downloader, used from Terminal on
 any Linux distribution. Frequently updated.
 Read more about it here: ${b}https://yt-dl.org/${enda}"
  echo && echo -en " ${y}Press Enter To Continue${endc}"
  read input
  echo -e " Installing ${b}Youtube Downloader${enda}"
  xterm -e wget https://yt-dl.org/latest/youtube-dl -O /usr/local/bin/youtube-dl
  echo -e " ${b}Youtube Downloader${enda} Was Successfully Installed"
  xterm -e chmod a+x /usr/local/bin/youtube-dl
  echo -e " All ${b}Youtube Downloader${enda} Files Were Flaged For Execute Successfully"
  echo && echo -e " Run Youtube Downloader From The Terminal: ${b}youtube-dl \"http://youtube.com/watch?v=XXXXXXX${enda}\" "
  echo && echo -en " ${y}Press Enter To Return To Menu${endc}"
  read input
}

# Install Skype
function installskype {
  #showlogo
  echo -e " Preparing To Install ${b}Skype${enda}" && echo
  echo -e " ${bu}Skype is a freemium voice-over-IP service and
 instant messaging client that is currently developed
 by the Microsoft Skype Division. The name originally
 derived from \"sky\" and \"peer\".
 Read more about it here: ${b}http://www.skype.com/${enda}"
  echo && echo -en " ${y}Press Enter To Continue${endc}"
  read input
  echo -e " Installing ${b}Skype${enda}"
  xterm -e wget -P /root/ http://download.skype.com/linux/skype-debian_4.3.0.37-1_i386.deb
  xterm -e dpkg -i /root/skype-debian_4.3.0.37-1_i386.deb
  xterm -e rm /root/skype-debian_4.3.0.37-1_i386.deb 
  echo -e " ${b}Skype${enda} Was Successfully Installed"
  echo && echo -e " Run Skype From The ${b}Internet${enda} Menu"
  echo && echo -en " ${y}Press Enter To Return To Menu${endc}"
  read input
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
			else
				echo -e "\e[32m[-] As You Wish !\e[0m"
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
select menusel in "VPN" "VPN-BOOK" "VirtualBox" "Bleachbit" "Sopcast" "GoldenDict" "Java" "Pinta" "ibus" "libreoffice" "knotes" "Tor Browser" "Fix Sound Mute" "Chromium" "Archive-Manager" "Gdebi" "bittorrent client" "Fix VMWare" "YouTube Downloader" "Install Skype" "Fix VLC" "Firefox" "Google Chrome" "Install All" "Back to Main"; do
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
		
	"Google Chrome")
	    installchrome
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

	"Chromium")
		installchromium
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

	"YouTube Downloader")
	    installytbdwn
	    pause
	    softwaresandystemtools ;;	

	"Install Skype")
	    installskype
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
		installchrome
		installchromium
		installytbdwn
        installskype
		install
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
######## Update metasploit
function updatemetasploit {
if [ ! -f /opt/dirs3arch.py ]; then
	echo -e "\e[1;31mThis option will update latest metasploit version!\e[0m"
	echo -e ""
	echo -e "Do you want to update it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
╦ ╦┌─┐┌┬┐┌─┐┌┬┐┬┌┐┌┌─┐  ┌┬┐┌─┐┌┬┐┌─┐┌─┐┌─┐┬  ┌─┐┬┌┬┐
║ ║├─┘ ││├─┤ │ │││││ ┬  │││├┤  │ ├─┤└─┐├─┘│  │ ││ │ 
╚═╝┴  ─┴┘┴ ┴ ┴ ┴┘└┘└─┘  ┴ ┴└─┘ ┴ ┴ ┴└─┘┴  ┴─┘└─┘┴ ┴ 
				\033[m"
				sleep 2
				git clone https://github.com/rapid7/metasploit-framework.git /opt/exploitation/metasploit/
			else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
	else
		echo -e "\e[32m[-] Metasploit already updated !\e[0m"
	fi
}
######## Update Social Engineering Toolkit
function updateSET {
	echo -e "\e[1;31mThis option will update latest SET version!\e[0m"
	echo -e ""
	echo -e "Do you want to update it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
╦ ╦┌─┐┌┬┐┌─┐┌┬┐┬┌┐┌┌─┐  ╔═╗╔═╗╔╦╗
║ ║├─┘ ││├─┤ │ │││││ ┬  ╚═╗║╣  ║ 
╚═╝┴  ─┴┘┴ ┴ ┴ ┴┘└┘└─┘  ╚═╝╚═╝ ╩ 
\033[m"
				sleep 2
				rm -rf /opt/exploitation/set/
				git clone https://github.com/trustedsec/social-engineer-toolkit.git /opt/exploitation/set/
				mv /usr/share/set/config/ /opt/exploitation/set/
				echo -e "\e[32m[-] Done!\e[0m"
			else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
}
######## Update Beef
function updateBeef {
	echo -e "\e[1;31mThis option will update latest Beef version!\e[0m"
	echo -e ""
	echo -e "Do you want to update it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
╦ ╦┌─┐┌┬┐┌─┐┌┬┐┬┌┐┌┌─┐  ╔╗ ┌─┐┌─┐┌─┐
║ ║├─┘ ││├─┤ │ │││││ ┬  ╠╩╗├┤ ├┤ ├┤ 
╚═╝┴  ─┴┘┴ ┴ ┴ ┴┘└┘└─┘  ╚═╝└─┘└─┘└  
				\033[m"
				sleep 2
				git clone https://github.com/beefproject/beef.git /opt/exploitation/beef/
				echo -e "\e[32m[-] Done!\e[0m"
			else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
}
######## Update Veil-Evasion
function updateVeil {
	echo -e "\e[1;31mThis option will update latest Veil version!\e[0m"
	echo -e ""
	echo -e "Do you want to update it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
 ____ ___            .___       __  .__                 ____   ____     .__.__            ___________                    .__               
|    |   \______   __| _/____ _/  |_|__| ____    ____   \   \ /   /____ |__|  |           \_   _____/__  _______    _____|__| ____   ____  
|    |   /\____ \ / __ |\__  \    __\  |/    \  / ___\   \   Y   // __ \|  |  |    ______  |    __)_\  \/ /\__  \  /  ___/  |/  _ \ /    \ 
|    |  / |  |_> > /_/ | / __ \|  | |  |   |  \/ /_/  >   \     /\  ___/|  |  |__ /_____/  |         \   /  / __ \_\___ \|  (  <_> )   |  |
|______/  |   __/\____ |(____  /__| |__|___|  /\___  /     \___/  \___  >__|____/         /_______  / \_/  (____  /____  >__|\____/|___|  /
          |__|        \/     \/             \//_____/                 \/                          \/            \/     \/               \/ 

				\033[m"
				sleep 2
				cd /opt/BypassAV/
				rm -rf Veil-Evasion/
				git clone https://github.com/Veil-Framework/Veil-Evasion.git /opt/BypassAV/Veil-Evasion/
				echo -e "\e[32m[-] Done!\e[0m"
			else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
}
######## Install system-config-samba
function installsystem-config-samba {
	echo -e "\e[1;31mThis option will install system-config-samba!\e[0m"
	echo -e ""
	echo -e "Do you want to update it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Installing system-config-samba ======\033[m"
				sleep 2
				apt-get install -y build-essential gfortran checkinstall python-all-dev cdbs debhelper quilt intltool python-central rarian-compat pkg-config gnome-doc-utils samba python-libuser libuser1 python-glade2
				mkdir ~/tmp
				cd ~/tmp
				wget https://launchpad.net/ubuntu/+archive/primary/+files/system-config-samba_1.2.63.orig.tar.gz
				tar xvf system-config-samba_1.2.63.orig.tar.gz
				wget https://launchpad.net/ubuntu/+archive/primary/+files/system-config-samba_1.2.63-0ubuntu5.diff.gz
				gunzip system-config-samba_1.2.63-0ubuntu5.diff.gz
				patch -p0 < system-config-samba_1.2.63-0ubuntu5.diff
				cd system-config-samba-1.2.63/
				dpkg-buildpackage -uc -us
				sudo dpkg -i ../system-config-samba_1.2.63-0ubuntu5_all.deb
				sudo touch /etc/libuser.conf
				gksu system-config-samba
				echo -e "\e[32m[-] Done!\e[0m"
			else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
}
######## Update Backdoor Factory
function updateBackdoorFactory {
	echo -e "\e[1;31mThis option will update latest Backdoor Factory version!\e[0m"
	echo -e ""
	echo -e "Do you want to update it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
╦ ╦┌─┐┌┬┐┌─┐┌┬┐┬┌┐┌┌─┐  ╔╗ ┌─┐┌─┐┬┌─┌┬┐┌─┐┌─┐┬─┐  ╔═╗┌─┐┌─┐┌┬┐┌─┐┬─┐┬ ┬
║ ║├─┘ ││├─┤ │ │││││ ┬  ╠╩╗├─┤│  ├┴┐ │││ ││ │├┬┘  ╠╣ ├─┤│   │ │ │├┬┘└┬┘
╚═╝┴  ─┴┘┴ ┴ ┴ ┴┘└┘└─┘  ╚═╝┴ ┴└─┘┴ ┴─┴┘└─┘└─┘┴└─  ╚  ┴ ┴└─┘ ┴ └─┘┴└─ ┴ 
				\033[m"
				sleep 2
				rm -rf /opt/BypassAV/the-backdoor-factory/
				git clone https://github.com/secretsquirrel/the-backdoor-factory.git /opt/BypassAV/the-backdoor-factory/
				./install.sh
				echo -e "\e[32m[-] Done!\e[0m"
			else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
}
######## Update tools to latest version
function updatetools {
clear
echo -e "
\033[31m\033[m

╦ ╦┌─┐┌┬┐┌─┐┌┬┐┌─┐  ┌┬┐┌─┐┌─┐┬  ┌─┐ 
║ ║├─┘ ││├─┤ │ ├┤    │ │ ││ ││  └─┐ 
╚═╝┴  ─┴┘┴ ┴ ┴ └─┘   ┴ └─┘└─┘┴─┘└─┘ 

\033[31m\033[m"
select menusel in "Metasploit" "Beef" "Veil-Evasion" "Social Engineering Toolkit" "Backdoor Factory" "Update All" "Back to Main"; do
case $menusel in
	"Metasploit")
		updatemetasploit
		pause
		updatetools ;;
	"Beef")
		updateBeef
		pause
		updatetools ;;
	"Veil-Evasion")
		updateVeil
		pause
		updatetools ;;
	"Social Engineering Toolkit")
		updateSET
		pause
		updatetools ;;
	"Backdoor Factory")
		updateBackdoorFactory
		pause
		updatetools ;;

	"Update All")
		updatemetasploit
		updateBeef
		updateVeil
		updateSET
		updateBackdoorFactory
		echo -e "\e[32m[-] Done Updating\e[0m"
		pause
		updatetools ;;

	"Back to Main")
		clear
		mainmenu ;;
		
	*)
		screwup
		updatetools ;;
	
		
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
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
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
	else
		echo -e "\e[32m[-] autopwn already installed !\e[0m"
	fi
}
######## Install Backdoor-Factory
function installbackdoorfactory {
if [ ! -f /opt/BypassAV/the-backdoor-factory/backdoor.py ]; then
	echo -e "\e[1;31mThis option will install Backdoor-Factory!\e[0m"
	echo -e "\e[1;31mPatch PE, ELF, Mach-O binaries with shellcode\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
╦┌┐┌┌─┐┌┬┐┌─┐┬  ┬  ┬┌┐┌┌─┐  ╔╗ ┌─┐┌─┐┬┌─┌┬┐┌─┐┌─┐┬─┐  ╔═╗┌─┐┌─┐┌┬┐┌─┐┬─┐┬ ┬
║│││└─┐ │ ├─┤│  │  │││││ ┬  ╠╩╗├─┤│  ├┴┐ │││ ││ │├┬┘  ╠╣ ├─┤│   │ │ │├┬┘└┬┘
╩┘└┘└─┘ ┴ ┴ ┴┴─┘┴─┘┴┘└┘└─┘  ╚═╝┴ ┴└─┘┴ ┴─┴┘└─┘└─┘┴└─  ╚  ┴ ┴└─┘ ┴ └─┘┴└─ ┴ 
\033[m"
				sleep 2
				git clone https://github.com/secretsquirrel/the-backdoor-factory.git /opt/BypassAV/the-backdoor-factory/
				cd /opt/BypassAV/the-backdoor-factory/
				./install.sh
			else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
	else
		echo -e "\e[32m[-] Backdoor Factory already installed !\e[0m"
	fi
}
######## Install wig
function installwig {
	echo -e "\e[1;31mThis option will install wig!\e[0m"
	echo -e "\e[1;31mWebApp Information Gatherer\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
╦┌┐┌┌─┐┌┬┐┌─┐┬  ┬  ┬┌┐┌┌─┐  ┬ ┬┬┌─┐  
║│││└─┐ │ ├─┤│  │  │││││ ┬  │││││ ┬  
╩┘└┘└─┘ ┴ ┴ ┴┴─┘┴─┘┴┘└┘└─┘  └┴┘┴└─┘  
				\033[m"
				sleep 2
				rm -rf /opt/intelligence-gathering/WebApp/wig/
				git clone https://github.com/jekyc/wig.git /opt/intelligence-gathering/WebApp/wig/
			else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
}
######### Install Spade
function installspade {
	echo -e "\e[1;31mThis option will install Spade!\e[0m"
	echo -e "\e[1;31mmake android apk backdoor\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
╦┌┐┌┌─┐┌┬┐┌─┐┬  ┬  ┬┌┐┌┌─┐  ╔═╗┌─┐┌─┐┌┬┐┌─┐
║│││└─┐ │ ├─┤│  │  │││││ ┬  ╚═╗├─┘├─┤ ││├┤ 
╩┘└┘└─┘ ┴ ┴ ┴┴─┘┴─┘┴┘└┘└─┘  ╚═╝┴  ┴ ┴─┴┘└─┘
                         \033[m"
            sleep 2
git clone https://github.com/suraj-root/spade.git /opt/spade/
cd spade/
chmod +x spade.py
else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
}
######### Install Nettool
function installnettool {
	echo -e "\e[1;31mThis option will install Nettool!\e[0m"
	echo -e "\e[1;31mAfter install type in new terminal : gnome-nettool!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
╦┌┐┌┌─┐┌┬┐┌─┐┬  ┬  ┬┌┐┌┌─┐  ╔╗╔┌─┐┌┬┐┌┬┐┌─┐┌─┐┬  
║│││└─┐ │ ├─┤│  │  │││││ ┬  ║║║├┤  │  │ │ ││ ││  
╩┘└┘└─┘ ┴ ┴ ┴┴─┘┴─┘┴┘└┘└─┘  ╝╚╝└─┘ ┴  ┴ └─┘└─┘┴─
                         \033[m"
                        
            sleep 2
            apt-get install gnome-nettool
            cd gnome-nettool  
           else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
}

# Install thad0ctor's BT5 Toolkit
function installthad0ctor {
  #showlogo
  echo -e " Preparing To Install ${b}thad0ctor's${enda}" && echo
  echo -e " ${bu}In short it is the ultimate tool for those looking to
 make a wide variety of word lists for dictionary
 based and other brute force attacks.
 Read more about it here: ${b}https://sourceforge.net/projects/thad0ctorstools/${enda}"
  echo && echo -en " ${y}Press Enter To Continue${endc}"
  read input
  echo -e " Installing ${b}thad0ctor's${enda}"
  xterm -e wget -P /root/ http://freefr.dl.sourceforge.net/project/thad0ctorstools/backtrack%205%20toolkit/backtrack%205%20toolkit%20v1.4/thad0ctors%20Backtrack%205%20toolkit%20v1.4.zip
  xterm -e unzip /root/thad0ctors\ Backtrack\ 5\ toolkit\ v1.4.zip
  xterm -e rm /root/thad0ctors\ Backtrack\ 5\ toolkit\ v1.4.zip
  echo -e " ${b}thad0ctor's${enda} Was Successfully Installed"
  echo && echo -e " Run thad0ctor's From The Terminal: ${b}./thad0ctors\ Backtrack\ 5\ toolkit/LAUNCH_TOOLKIT.sh${enda}"
  echo && echo -en " ${y}Press Enter To Return To Menu${endc}"
  read input
}
######## Install Hackpack
function installhackpack {
	echo -e "\e[1;31mThis option will install Hackpack!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
			echo -e "\033[31m
  ___ ___                __                         __    
 /   |   \_____    ____ |  | _____________    ____ |  | __
/    ~    \__  \ _/ ___\|  |/ /\____ \__  \ _/ ___\|  |/ /
\    Y    // __ \   \___|    < |  |_> > __ \   \___|    < 
 \___|_  /(____  /\___  >__|_ \|   __(____  /\___  >__|_ |
       \/      \/     \/     \/|__|       \/     \/     \/
                         \033[m"                        
            sleep 2	

            firefox http://www.lincoder.com/wp-content/uploads/2016/01/hackpack.tar
            chmod 777 install.sh
            /install.sh

            else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
}

######## Install Atscan
function installatscan {
	echo -e "\e[1;31mThis option will install Atscan!\e[0m"
	echo -e "\e[1;31mAdvance Dork Search\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
echo -e "\033[31m
╔═╗╔╦╗╔═╗╔═╗╔═╗╔╗╔
╠═╣ ║ ╚═╗║  ╠═╣║║║
╩ ╩ ╩ ╚═╝╚═╝╩ ╩╝╚╝
                 
 \033[m"                        
            sleep 2	

            git clone https://github.com/AlisamTechnology/ATSCAN.git /opt/ATSCAN/

            else
				echo -e "\e[32m[-] As You Wish!\e[0m"
			fi
}	
######## Install OpenDoor
function installopendoor {
	echo -e "\e[1;31mThis option will install OpenDoor!\e[0m"
	echo -e "\e[1;31mOWASP Directory Access\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
echo -e "\033[31m
╔═╗┌─┐┌─┐┌┐┌╔╦╗┌─┐┌─┐┬─┐
║ ║├─┘├┤ │││ ║║│ ││ │├┬┘
╚═╝┴  └─┘┘└┘═╩╝└─┘└─┘┴└─
                 
 \033[m"        
         sleep 2                
       git clone  https://github.com/stanislav-web/OpenDoor.git  /opt/OpenDoor/
       sudo pip install -r requirements.txt
  else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
}	

######## Install Whitewidow
function installwhitewidow {
	echo -e "\e[1;31mThis option will install Whitewidow!\e[0m"
	echo -e "\e[1;31mscan a website for sql injection\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
echo -e "\033[31m
╦ ╦┬ ┬┬┌┬┐┌─┐┬ ┬┬┌┬┐┌─┐┬ ┬
║║║├─┤│ │ ├┤ ││││ │││ ││││
╚╩╝┴ ┴┴ ┴ └─┘└┴┘┴─┴┘└─┘└┴┘                 
 \033[m"        
         sleep 2                
       git clone https://github.com/WhitewidowScanner/whitewidow.git /opt/Whitewidow
       cd /opt/Whitewidow/
       bundle install
  else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
}	
######## Install Unicorn
function installunicorn {
if [ ! -f /opt/BypassAV/unicorn-master/unicorn.py ]; then
	echo -e "\e[1;31mThis option will install Unicorn!\e[0m"
	echo -e "\e[1;31mUnicorn is a simple tool for using a PowerShell downgrade attack and inject shellcode straight into memory.\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
╦ ╦┌┐┌┬┌─┐┌─┐┬─┐┌┐┌  
║ ║│││││  │ │├┬┘│││  
╚═╝┘└┘┴└─┘└─┘┴└─┘└┘  
				\033[m"
				sleep 2
				git clone https://github.com/trustedsec/unicorn.git /opt/BypassAV/unicorn-master
			else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
	else
		echo -e "\e[32m[-] Unicorn already installed !\e[0m"
	fi
}

#######  Install Metagoofil
function installmetagoofil {
	echo -e "\e[1;31mThis option will install Metagoofil!\e[0m"
	echo -e "\e[1;31mWebsite infromation gathering\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
╔╦╗┌─┐┌┬┐┌─┐┌─┐┌─┐┌─┐┌─┐┬┬  
║║║├┤  │ ├─┤│ ┬│ ││ │├┤ ││  
╩ ╩└─┘ ┴ ┴ ┴└─┘└─┘└─┘└  ┴┴─┘ 
				\033[m"
				sleep 2
				apt-get install metagoofil
			else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi	
}
#######  Install XSSER
function installxsser {
	echo -e "\e[1;31mThis option will install XSSER!\e[0m"
	echo -e "\e[1;32mFind vulnerable website\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
  if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
 __  __     ______     ______     ______     ______    
/\_\_\_\   /\  ___\   /\  ___\   /\  ___\   /\  == \   
\/_/\_\/_  \ \___  \  \ \___  \  \ \  __\   \ \  __<   
  /\_\/\_\  \/\_____\  \/\_____\  \ \_____\  \ \_\ \_\ 
  \/_/\/_/   \/_____/   \/_____/   \/_____/   \/_/ /_/ 
                                                       
\033[m"
				sleep 2
                git clone https://github.com/epsylon/xsser /opt/XSSER/
                cd /opt/XSSER/
                chmod +x setup.py
                python setup.py install
            else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi	
}
######## Install pyobfuscate
function installpyobfuscate {
if [ ! -f /opt/BypassAV/pyobfuscate-master/pyobfuscate.py ]; then
	echo -e "\e[1;31mThis option will install pyobfuscate!\e[0m"
	echo -e "\e[1;31mA Pyobfuscate fork made specifically to randomize and obfuscate python based payloads\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
╔═╗┬ ┬┌─┐┌┐ ┌─┐┬ ┬┌─┐┌─┐┌─┐┌┬┐┌─┐
╠═╝└┬┘│ │├┴┐├┤ │ │└─┐│  ├─┤ │ ├┤ 
╩   ┴ └─┘└─┘└  └─┘└─┘└─┘┴ ┴ ┴ └─┘
				\033[m"
				sleep 2
				git clone https://github.com/byt3bl33d3r/pyobfuscate.git /opt/BypassAV/pyobfuscate-master/
				cd /opt/BypassAV/pyobfuscate-master/
				python setup.py install
			else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
	else
		echo -e "\e[32m[-] pyobfuscate already installed !\e[0m"
	fi
}

######## Install commix
function installcommix {
	echo -e "\e[1;31mThis option will install commix!\e[0m"
	echo -e "\e[1;31mAutomated All-in-One OS Command Injection and Exploitation Tool\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m
._______ ._______  ._____.___ ._____.___ .___  ____   ____
:_.  ___\: .___  \ :         |:         |: __| \   \_/   /
|  : |/\ | :   |  ||   \  /  ||   \  /  || : |  \___ ___/ 
|    /  \|     :  ||   |\/   ||   |\/   ||   |  /   _   \ 
|. _____/ \_. ___/ |___| |   ||___| |   ||   | /___/ \___|
 :/         :/           |___|      |___||___|            
 :          :                                             
     
				\033[m"
				sleep 2
				rm -rf /opt/exploitation/WebApp/commix-master/
				git clone https://github.com/stasinopoulos/commix.git /opt/exploitation/WebApp/commix-master/
			else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
}

######## Install netripper
function installnetripper {
	echo -e "\e[1;31mThis option will install netripper!\e[0m"
	echo -e "\e[1;31mNetRipper – this is a fairly recent tool that is positioned for the post-operating system based on Windows and uses a number of non-standard approach to extract sensitive data. It uses API hooking in order to intercept network traffic and encryption related functions from a low privileged user, being able to capture both plain-text traffic and encrypted traffic before encryption/after decryption. This tool was first demonstrated at the Defcon 23 in Vegas.\e[0m"
	echo -e "\e[1;31mHow to use netripper\e[0m"
	echo -e "\e[1;31mhttp://kali-linux.co/forums/topic/shellter-metasploit-netripper-bypass-antivirus-and-sniff-https-password\e[0m"
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Installing netripper ======\033[m"
				sleep 2
				rm -rf /opt/exploitation/Network/netripper/
				git clone git clone https://github.com/NytroRST/NetRipper.git /opt/exploitation/Network/netripper/
				cd /opt/exploitation/Network/netriper/Metasploit
				cp netripper.rb /usr/share/metasploit-framework/modules/post/windows/gather/netripper.rb
				mkdir /usr/share/metasploit-framework/modules/post/windows/gather/netripper
				g++ -Wall netripper.cpp -o netripper
				cp netripper /usr/share/metasploit-framework/modules/post/windows/gather/netripper/netripper
				cd ../Release/
				cp DLL.dll /usr/share/metasploit-framework/modules/post/windows/gather/netripper/DLL.dll
				echo -e "\e[32m[-] Done Installing!\e[0m"
			else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
}

######## Install Harness
function installharness {
	echo -e "\e[1;31mThis option will install Harness!\e[0m"
	echo -e "\e[1;31mReverse engineering framework in Python\e[0m"
	echo -e "\e[1;31mHow to use Harness\e[0m"
	echo -e "\e[1;31mhttps://www.youtube.com/watch?v=3Za8IXtZG9k\e[0m"
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m====== Installing Harness ======\033[m"
				sleep 2
				rm -rf /opt/exploitation/Network/Harness/
				git clone https://github.com/Rich5/Harness.git /opt/exploitation/Network/Harness/
				cd /opt/exploitation/Network/Harness/
				wget http://python.org/ftp/python/3.4.3/Python-3.4.3.tar.xz
				tar xf Python-3.4.3.tar.xz
				cd Python-3.4.3
				./configure --prefix=/usr/local --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib"
				make && make altinstall
				echo -e "\e[32m[-] Done Installing!\e[0m"
			else
				echo -e "\e[32m[-] As You Wish !\e[0m"
			fi
}

####################################################################
#Install wifiphiser
######################################################################
function installwifiphiser {
	clear
	echo""
	echo -e $white"Wifiphisher is a security tool that mounts automated phishing attacks against WiFi networks in order to obtain secret passphrases or other credentials "
	echo -e "it is a social engineering attack that unlike other methods it does not include any brute forcing."
	echo""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
				echo -e "\033[31m========================== Installing WifiPhiser ============================\033[m"
				sleep 2
				rm -rf /root/wifiphiser
				$GIT_CLONE https://github.com/Tle7839/wifiphiser.git /root/WifiPhiser/
				echo 
				echo -e "\033[31m================ Finish , now linset in /root/WifiPhiser ======================\033[m"
			else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi
}

####################################################################
#Install Weeman
######################################################################
function installiweeman {
	clear
	echo""
	echo -e $white"HTTP server for phishing in python. (and framework) "
	echo -e "Usually you will want to run Weeman with DNS spoof attack. (see dsniff, ettercap)."
	echo""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
				echo -e "\033[31m========================== Installing Weeman ============================\033[m"
				sleep 2
				rm -rf /root/Weeman
				$GIT_CLONE https://github.com/Hypsurus/weeman.git /root/Weeman/
				echo 
				echo -e "\033[31m================ Finish , now linset in /root/Weeman ======================\033[m"
			else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi
}

####################################################################
#Install yamas
#####################################################################
function installiyamas {
	if [ ! -f /usr/bin/yamas ]; then
		echo "Yamas is not installed. Do you want to install it ? (Y/N)"
		read install
		if [[ $install = Y || $install = y ]] ; then
			cd /tmp
			wget http://comax.fr/yamas/bt5/yamas.sh
			cp yamas.sh /usr/bin/yamas
			chmod +x /usr/bin/yamas
			rm yamas.sh
			cd
			echo "Script should now be installed. Launching it !"
			sleep 3
			gnome-terminal -t "Yamas" -x bash yamas 2>/dev/null & sleep 2
			exit 1
		else
			echo -e "\e[32m[-] As You Wish !\e[0m"
		fi
	else
		echo "Script is installed"
		gnome-terminal -t "Yamas" -x bash yamas 2>/dev/null & sleep 2
		sleep 1
	fi		
}

################################################################### 
#Install fatrat
######################################################################
function installfatrat {
	echo -e "\e[1;31mThis option will install TheFatRat\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then	
				echo -e "\033[31m============== Installing TheFatRat ===============\033[m"
				sleep 2
				$GIT_CLONE https://github.com/screetsec/thefatrat.git /usr/share/
				echo ""
				echo -e "\e[32m[-] Done Installing!\e[0m"
				echo ""
				echo -e $red "Your location file in /usr/share/TheFatRat/ "
			else
				echo -e "\e[32m[-] As You Wish !\e[0m"
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

select menusel in   "Masscan" "Morpheus" "bettercap" "Commix" "seclist" "Fluxion" "Mitmf" "Backdoor-Factory" "Wig" "Spade" "Nettool" "Thad0ctor" "Hackpack" "Atscan" "OpenDoor" "Whitewidow" "Unicorn" "Metagofil" "XSSER" "Pyobfuscate" "NetRipper" "Harness" "Wifiphiser" "Weeman" "Yamas" "Fatrat" "Install All" "Back to Main"; do
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
  
 "Backdoor-Factory")
       installbackdoorfactory
       pause
       hackingtools ;;

 "Wig")
       installwig
       pause
       hackingtools ;;

"Spade")
       installspade
       pause
       hackingtools ;;

"Nettool")
       installnettool
       pause
       hackingtools ;;       

"Thad0ctor")
       installthad0ctor
       pause
       hackingtools ;;

 "Hackpack")
       installhackpack
       pause      
       hackingtools ;;
  
  "Atscan")
       installatscan
       pause
       hackingtools ;;

  "OpenDoor")
      installopendoor
      pause
      hackingtools ;;
   
  "Whitewidow")
      installwhitewidow
      pause
      hackingtools ;;

  "Unicorn")
      installunicorn
      pause
      hackingtools ;;

  "Metagofil")
      installmetagoofil
      pause
      hackingtools ;;
 
  "XSSER")
      installxsser
      pause
      hackingtools ;;
  
  "Pyobfuscate")
     installpyobfuscate
     pause
     hackingtools ;;

   "Commix")
     installcommix
     pause
     hackingtools ;;

"NetRipper")
		installnetripper
		pause 
		hackingtools ;;

 "Harness")
	  installharness
	  pause
	  hackingtools ;;

 "Wifiphiser")
      installwifiphiser
      pause
      hackingtools ;;

  "Weeman")
      installiweeman
      pause 
      hackingtools ;; 

   "Yamas")
      installiyamas
      pause
      hackingtools ;;   

   "Fatrat")
       installfatrat
       pause
       hackingtools ;;

 "Install All")
    installmasscan
    installmorpheus
    installbettercap 
    installseclist
    installfluxion
    installmitmf
	installbackdoorfactory
	installwig
	installspade
	installnettool
	installthad0ctor
	installhackpack
	installatscan
	installopendoor
	installwhitewidow
	installmetagoofil
	installxsser
	installpyobfuscate
    installcommix
	echo -e "\e[32m[-] 
╔╦╗┌─┐┌┐┌┌─┐  ╦┌┐┌┌─┐┌┬┐┌─┐┬  ┬  ┬┌┐┌┌─┐  ┬ ┬┌─┐┌─┐┬┌─┬┌┐┌┌─┐┌┬┐┌─┐┌─┐┬  ┌─┐
 ║║│ ││││├┤   ║│││└─┐ │ ├─┤│  │  │││││ ┬  ├─┤├─┤│  ├┴┐│││││ ┬ │ │ ││ ││  └─┐
═╩╝└─┘┘└┘└─┘  ╩┘└┘└─┘ ┴ ┴ ┴┴─┘┴─┘┴┘└┘└─┘  ┴ ┴┴ ┴└─┘┴ ┴┴┘└┘└─┘ ┴ └─┘└─┘┴─┘└─┘
	\e[0m"
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

##### ACCCHECK
function installacccheck { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing acccheck ============================\033[m"
	      sleep 2
          apt-get install acccheck
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### ace-voip
function installace-voip { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing ace-voip ============================\033[m"
	      sleep 2
          apt-get install ace-voip
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}
##### amap
function installamap { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing amap ============================\033[m"
	      sleep 2
          apt-get install amap
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### automater
function installautomater { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing automater ============================\033[m"
	      sleep 2
          apt-get install automater
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### bing-ip2hosts
function installbing-ip2hosts { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing bing-ip2hosts ============================\033[m"
	      sleep 2
          wget http://www.morningstarsecurity.com/downloads/bing-ip2hosts-0.4.tar.gz && tar -xzvf bing-ip2hosts-0.4.tar.gz && cp bing-ip2hosts-0.4/bing-ip2hosts /usr/local/bin/
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### braa
function installbraa { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing braa ============================\033[m"
	      sleep 2
          apt-get install braa
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### casefile
function installcasefile { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing casefile ============================\033[m"
	      sleep 2
          apt-get install casefile
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### cdpsnarf
function installcdpsnarf { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing cdpsnarf ============================\033[m"
	      sleep 2
          apt-get install cdpsnarf
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### cisco-torch
function installcisco-torch { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing cisco-torch ============================\033[m"
	      sleep 2
          apt-get install cisco-torch
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### cookie-cadger
function installcookie-cadger { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing cookie-cadger ============================\033[m"
	      sleep 2
          apt-get install cookie-cadger
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### copy-router-config
function installcopy-router-config { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing copy-router-config ============================\033[m"
	      sleep 2
          apt-get install copy-router-config
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### dmitry
function installdmitry { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing dmitry ============================\033[m"
	      sleep 2
          apt-get install dmitry
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### dnmap
function installdnmap { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing dnmap ============================\033[m"
	      sleep 2
          apt-get install dnmap
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### dnsenum
function installdnsenum { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing dnsenum ============================\033[m"
	      sleep 2
          apt-get install dnsenum
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### dnsrecon
function installdnsrecon { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing dnsrecon ============================\033[m"
	      sleep 2
          apt-get install dnsrecon
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### dnstracer
function installdnstracer { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing dnstracer ============================\033[m"
	      sleep 2
          apt-get install dnstracer
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### dnswalk
function installdnswalk { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing dnswalk ============================\033[m"
	      sleep 2
          apt-get install dnswalk
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### dotdotpwn
function installdotdotpwn { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing dotdotpwn ============================\033[m"
	      sleep 2
          apt-get install dotdotpwn
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### enum4linux
function installenum4linux { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing enum4linux ============================\033[m"
	      sleep 2
          apt-get install enum4linux
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### enum4linux
function installenumiax { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing enumiax ============================\033[m"
	      sleep 2
          apt-get install enumiax
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### exploitdb
function installexploitdb { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing exploitdb ============================\033[m"
	      sleep 2
          apt-get install exploitdb
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### fierce
function installfierce { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing fierce ============================\033[m"
	      sleep 2
          apt-get install fierce
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### fierce
function installfirewalk { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing firewalk ============================\033[m"
	      sleep 2
          apt-get install firewalk
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### fragroute
function installfragroute { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing fragroute ============================\033[m"
	      sleep 2
          apt-get install fragroute
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### fragrouter
function installfragrouter { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing fragrouter ============================\033[m"
	      sleep 2
          apt-get install fragrouter
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}


##### ghost-phisher
function installghost-phisher { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing ghost-phisher ============================\033[m"
	      sleep 2
          apt-get install ghost-phisher
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}


##### golismero
function installgolismero { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing golismero ============================\033[m"
	      sleep 2
          apt-get install golismero
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### goofile
function installgoofile { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing goofile ============================\033[m"
	      sleep 2
          apt-get install goofile
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### lbd
function installlbd { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing lbd ============================\033[m"
	      sleep 2
          apt-get install lbd
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### maltego-teeth
function installmaltego-teeth { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing maltego-teeth ============================\033[m"
	      sleep 2
          apt-get install maltego-teeth
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### masscan
function installmasscan { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing masscan ============================\033[m"
	      sleep 2
          apt-get install masscan
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### metagoofil
function installmetagoofil { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing metagoofil ============================\033[m"
	      sleep 2
          apt-get install metagoofil
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### miranda
function installmiranda { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing miranda ============================\033[m"
	      sleep 2
          apt-get install miranda
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### nmap
function installnmap { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing nmap ============================\033[m"
	      sleep 2
          apt-get install nmap
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### p0f
function installp0f { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing p0f ============================\033[m"
	      sleep 2
          apt-get install p0f
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### parsero
function installparsero { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing parsero ============================\033[m"
	      sleep 2
          apt-get install parsero
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### recon-ng
function installrecon-ng { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing recon-ng ============================\033[m"
	      sleep 2
          apt-get install recon-ng
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### set
function installset { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing set ============================\033[m"
	      sleep 2
          apt-get install set
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### smtp-user-enum
function installsmtp-user-enum { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing smtp-user-enum ============================\033[m"
	      sleep 2
          apt-get install smtp-user-enum
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### snmpcheck
function installsnmpcheck { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing snmpcheck ============================\033[m"
	      sleep 2
          apt-get install snmpcheck
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### sslcaudit
function installsslcaudit { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing sslcaudit ============================\033[m"
	      sleep 2
          apt-get install sslcaudit
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### sslcaudit
function installsslsplit { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing sslsplit ============================\033[m"
	      sleep 2
          apt-get install sslsplit
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### sslstrip
function installsslstrip { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing sslstrip ============================\033[m"
	      sleep 2
          apt-get install sslstrip
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### sslyze
function installsslyze { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing sslyze ============================\033[m"
	      sleep 2
          apt-get install sslyze
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### thc-ipv6
function installthc-ipv6 { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing thc-ipv6 ============================\033[m"
	      sleep 2
          apt-get install thc-ipv6
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### theharvester
function installtheharvester { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing theharvester ============================\033[m"
	      sleep 2
          apt-get install theharvester
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### tlssled
function installtlssled { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== tlssled ============================\033[m"
	      sleep 2
          apt-get install tlssled
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### twofi
function installtwofi { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== twofi ============================\033[m"
	      sleep 2
          apt-get install twofi
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### urlcrazy
function installurlcrazy { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== urlcrazy ============================\033[m"
	      sleep 2
          apt-get install urlcrazy
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### wireshark
function installwireshark { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== wireshark ============================\033[m"
	      sleep 2
          apt-get install wireshark
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### wol-e
function installwol-e { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== wol-e ============================\033[m"
	      sleep 2
          apt-get install wol-e
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### xplico
function installxplico { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== xplico ============================\033[m"
	      sleep 2
          apt-get install xplico
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### ismtp
function installismtp { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== ismtp ============================\033[m"
	      sleep 2
          apt-get install ismtp
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### intrace
function installintrace { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== intrace ============================\033[m"
	      sleep 2
          apt-get install intrace
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### hping3
function installhping3 { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== hping3 ============================\033[m"
	      sleep 2
          apt-get install hping3
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}
##### All
function installall { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== ALL ============================\033[m"
	      sleep 2
          apt-get install -y acccheck ace-voip amap automater braa casefile cdpsnarf cisco-torch cookie-cadger copy-router-config dmitry dnmap dnsenum dnsmap dnsrecon dnstracer dnswalk dotdotpwn enum4linux enumiax exploitdb fierce firewalk fragroute fragrouter ghost-phisher golismero goofile lbd maltego-teeth masscan metagoofil miranda nmap p0f parsero recon-ng set smtp-user-enum snmpcheck sslcaudit sslsplit sslstrip sslyze thc-ipv6 theharvester tlssled twofi urlcrazy wireshark wol-e xplico ismtp intrace hping3 && wget http://www.morningstarsecurity.com/downloads/bing-ip2hosts-0.4.tar.gz && tar -xzvf bing-ip2hosts-0.4.tar.gz && cp bing-ip2hosts-0.4/bing-ip2hosts /usr/local/bin/
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi
}

##### Information Gathering
function infomationgathering {
clear
echo -e "
\033[31m\033[m
\033[31m
Information Gathering

\033[m              
\033[31m\033[m"
select menusel in  "Acccheck" "ace-voip" "amap" "automater" "bing-ip2hosts" "braa" "casefile" "cdpsnarf" "cisco-torch" "cookie-cadger" "copy-router-config" "dmitry" "dnmap" "dnsenum" "dnsrecon" "dnstracer" "installdnswalk" "dotdotpwn" "enum4linux" "enumiax" "exploitdb" "fierce" "firewalk" "fragroute" "fragrouter" "ghost-phisher" "golismero" "goofile" "lbd" "maltego-teeth" "masscan" "metagoofil" "miranda" "nmap" "p0f" "parsero" "recon-ng" "set" "smtp-user-enum" "snmpcheck" "sslcaudit" "sslsplit" "sslstrip" "sslyze" "thc-ipv6" "theharvester" "tlssled" "twofi" "urlcrazy" "wireshark" "wol-e" "xplico" "ismtp" "intrace" "hping3" "Install All" "Back to Main"; do
case $menusel in

  "Acccheck")
      installacccheck
      pause
      kalitools ;;

   "ace-voip")
      pause 
      installace-voip
      kalitools ;;

    "amap")
       installamap
       pause
       kalitools ;;

    "automater")
       installautomater  
       pause 
       kalitools ;; 

    "bing-ip2hosts")
        installbing-ip2hosts
        pause
        kalitools ;;   

    "braa")
        installbraa
        pause
        kalitools ;; 
      
    "casefile")
        installcasefile
        pause
        kalitools ;;

    "cdpsnarf")
         installcdpsnarf
         pause
         kalitools ;; 
       
    "cisco-torch")
         installcisco-torch
         pause
         kalitools ;;  
 
    "cookie-cadger")
          installcookie-cadger
          pause
          kalitools ;;  

    "copy-router-config")
          installcopy-router-config
          pause
          kalitools ;; 
          
    "dmitry")
          installdmitry
          pause
          kalitools ;; 

    "dnmap")
          installdnmap
          pause
          kalitools ;;
          
    "dnsenum")
          installdnsenum
          pause
          kalitools ;;
            
    "dnsrecon")
          installdnsrecon
          pause 
          kalitools ;; 
            
    "dnstracer")
          installdnstracer
          pause
          kalitools ;; 
   
    "dnswalk")
          installdnswalk
          pause 
          kalitools ;; 
              
    "dotdotpwn")
          installdotdotpwn
          pause 
          kalitools ;; 

    "enum4linux")
          installenum4linux
          pause 
          kalitools ;; 

    "enumiax") 
          installenumiax
          pause 
          kalitools ;; 
                
    "exploitdb")
          installexploitdb
          pause 
          kalitools ;; 

    "fierce") 
          installfierce
          pause 
          kalitools ;; 

    "firewalk")
          installfirewalk
          pause 
          kalitools ;; 

    "fragroute")
          installfragroute
          pause 
          kalitools ;; 

    "fragrouter")
          installfragrouter
          pause 
          kalitools ;; 

    "ghost-phisher")
          installghost-phisher
          pause 
          kalitools ;; 

    "golismero")
          installgolismero
          pause 
          kalitools ;; 

    "goofile") 
          installgoofile
          pause 
          kalitools ;; 

    "lbd")
          installlbd
          pause 
          kalitools ;; 

    "maltego-teeth")
          installmaltego-teeth
          pause 
          kalitools ;; 

    "masscan")
          installmasscan
          pause 
          kalitools ;; 
         
    "metagoofil")
          installmetagoofil
          pause 
          kalitools ;; 
                  
    "miranda")
          installmiranda
          pause  
          kalitools ;; 

    "nmap")
          installnmap
          pause 
          kalitools ;; 

    "p0f")
          installp0f
          pause 
          kalitools ;;
                    
    "parsero")
          installparsero
          pause 
          kalitools ;;

    "recon-ng")
          installrecon-ng
          pause 
          kalitools ;; 
                   
    "set")
          installset
          pause 
          kalitools ;; 

    "smtp-user-enum")
          installsmtp-user-enum
          pause 
          kalitools ;; 

    "snmpcheck")
          installsnmpcheck
          pause 
          kalitools ;;
 
    "sslcaudit")
          installsslcaudit
          pause 
          kalitools ;; 

    "sslsplit")
          installsslsplit
          pause
          kalitools ;; 

    "sslstrip")
          installsslstrip
          pause 
          kalitools ;; 
          
    "sslyze")
          installsslyze
          pause 
          kalitools ;; 

    "thc-ipv6")
          installthc-ipv6
          pause 
          kalitools ;; 

    "theharvester")
          installtheharvester
          pause 
          kalitools ;; 

    "tlssled")
          installtlssled
          pause
          kalitools ;;

    "twofi")
          installtwofi
          pause
          kalitools ;;   

    "urlcrazy")
          installurlcrazy
          pause
          kalitools ;;        

    "wireshark")
          installwireshark
          pause 
          kalitools ;;  

    "wol-e")
          installwol-e
          pause 
          kalitools ;;  

    "xplico")
          installxplico
          pause 
          kalitools ;;      
           
    "ismtp")
          installismtp
          pause 
          kalitools ;; 

    "intrace")
          installintrace
          pause
          kalitools ;;   

    "hping3")
          installhping3
          pause 
          kalitools ;;

    "Install All")
          installall
          pause
          kalitools ;;      

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













##### BBQSQL
function installbbqsql { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing BBQSQL ============================\033[m"
	      sleep 2
          apt-get install bbqsql
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### BED
function installbed { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing BED ============================\033[m"
	      sleep 2
          apt-get install bed
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}
##### cisco-auditing-tool
function installcisco-auditing-tool { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing cisco-auditing-tool ============================\033[m"
	      sleep 2
          apt-get install cisco-auditing-tool
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### cisco-global-exploiter
function installcisco-global-exploiter { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing cisco-global-exploiter ============================\033[m"
	      sleep 2
          apt-get install cisco-global-exploiter
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### cisco-ocs
function installcisco-ocs { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing cisco-ocs ============================\033[m"
	      sleep 2
          apt-get install cisco-ocs
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### cisco-torch
function installcisco-torch { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing cisco-torch ============================\033[m"
	      sleep 2
          apt-get install cisco-torch
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### casefile
function installcasefile { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing casefile ============================\033[m"
	      sleep 2
          apt-get install casefile
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### copy-router-config
function installcopy-router-config { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing copy-router-config ============================\033[m"
	      sleep 2
          apt-get install copy-router-config
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### commix
function installcommix { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing commix ============================\033[m"
	      sleep 2
          apt-get install git && git clone https://github.com/stasinopoulos/commix.git commix && cd commix && python ./commix.py --install
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### DBPwAudit
function installDBPwAudit { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing DBPwAudit ============================\033[m"
	      sleep 2
	      wget http://www.cqure.net/tools/dbpwaudit_0_8.zip
          echo 'download page : http://www.cqure.net/wp/tools/database/dbpwaudit/'
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### DoonaDot
function installDoonaDot { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing DoonaDot ============================\033[m"
	      sleep 2
          apt-get install doona
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### Greenbone Security
function installgreenbonesecurity { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing Greenbone Security Assistant ============================\033[m"
	      sleep 2
          apt-get install greenbone-security-assistant
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### DotPwn
function installDotPwn { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing DotPwn ============================\033[m"
	      sleep 2
          apt-get install dotdotpwn
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### GSD
function installGSD { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing GSD ============================\033[m"
	      sleep 2
          apt-get install git && git clone git://git.kali.org/packages/gsd.git
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### hexorbase
function installhexorbase { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing hexorbase ============================\033[m"
	      sleep 2
          apt-get install hexorbase
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### Inguma
function installInguma { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing Inguma ============================\033[m"
	      sleep 2
          wget https://sourceforge.net/projects/inguma/files/latest/download
          wget https://downloads.sourceforge.net/project/inguma/inguma/Inguma%200.1.0%20%28R1%29/inguma-0.1.1.tar.gz?r=&ts=1494952159&use_mirror=netix
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### jSQL
function installjSQL { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing jSQL ============================\033[m"
	      sleep 2
          apt-get install jsql
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### Lynis
function installLynis { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing Lynis ============================\033[m"
	      sleep 2
          apt-get install lynis
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### Nmap
function installnmap { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing Nmap ============================\033[m"
	      sleep 2
          apt-get install nmap
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### ohrwurm
function installohrwurm { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing ohrwurm ============================\033[m"
	      sleep 2
          apt-get install ohrwurm
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### openvas-administrator
function installopenvas-administrator { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing openvas-administrator ============================\033[m"
	      sleep 2
          apt-get install openvas-administrator
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### openvas-cli
function openvas-cli { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing openvas-cli ============================\033[m"
	      sleep 2
          apt-get install openvas-cli
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### openvas-manager
function installopenvas-manager { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing openvas-manager ============================\033[m"
	      sleep 2
          apt-get install openvas-manager
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### openvas-scanner
function installopenvas-scanner { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing openvas-scanner ============================\033[m"
	      sleep 2
          apt-get install openvas-scanner
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### oscanner
function installoscanner { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing oscanner ============================\033[m"
	      sleep 2
          apt-get install oscanner
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}


##### powerfuzzer
function installpowerfuzzer { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing powerfuzzer ============================\033[m"
	      sleep 2
          apt-get install powerfuzzer
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}


##### sfuzz
function installsfuzz { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing sfuzz ============================\033[m"
	      sleep 2
          apt-get install sfuzz
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### sidguesser
function installsidguesser { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing sidguesser ============================\033[m"
	      sleep 2
          apt-get install sidguesser
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### siparmyknife
function installsiparmyknife { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing siparmyknife============================\033[m"
	      sleep 2
          apt-get install siparmyknife
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### sqlmap
function installsqlmap { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing sqlmap ============================\033[m"
	      sleep 2
          apt-get install sqlmap
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### sqlninja
function installsqlninja { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing sqlninja ============================\033[m"
	      sleep 2
          apt-get install sqlninja
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### sqlsus
function installsqlsus { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing sqlsus ============================\033[m"
	      sleep 2
          apt-get install sqlsus
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### thc-ipv6
function installthc-ipv6 { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing thc-ipv6 ============================\033[m"
	      sleep 2
          apt-get install thc-ipv6
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### tnscmd10g
function installtnscmd10g { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing tnscmd10g ============================\033[m"
	      sleep 2
          apt-get install tnscmd10g
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### unix-privesc-check
function installunix-privesc-check { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing unix-privesc-check ============================\033[m"
	      sleep 2
          apt-get install unix-privesc-check
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### yersinia
function installyersinia { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing yersinia ============================\033[m"
	      sleep 2
          apt-get install yersinia
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### Vulnerability Analysis
function vulnerabilityanalysis {
clear
echo -e "
\033[31m\033[m
\033[31m
Information Gathering

\033[m              
\033[31m\033[m"
select menusel in  "BBQSQL" "BED" "cisco-auditing-tool" "cisco-global-exploiter" "cisco-ocs" "cisco-torch" "copy-router-config" "commix" "DBPwAudit" "DoonaDot" "DotPwn" "Greenbone Security" "GSD" "HexorBase" "Inguma" "jSQL" "Lynis" "Nmap" "ohrwurm" "openvas-administrator" "openvas-cli" "openvas-manager" "openvas-scanner" "Oscanner" "Powerfuzzer" "sfuzz" "SidGuesser" "SIPArmyKnife" "sqlmap" "Sqlninja" "sqlsus" "THC-IPV6" "tnscmd10g" "unix-privesc-check" "Yersinia" "Install All" "Back to Main"; do
case $menusel in

  "BBQSQL")
      installbbqsql
      pause
      kalitools ;;

   "BED")
      installbed
      pause 
      kalitools ;;

    "cisco-auditing-tool")
       installcisco-auditing-tool
       pause
       kalitools ;;

    "cisco-global-exploiter")
       installcisco-global-exploiter
       pause 
       kalitools ;; 

    "cisco-ocs")
        installcisco-ocs
        pause
        kalitools ;;   

    "cisco-torch")
        installcisco-torch
        pause
        kalitools ;; 
      
    "casefile")
        installcasefile
        pause
        kalitools ;;

    "copy-router-config")
         installcopy-router-config
         pause
         kalitools ;; 
       
    "commix")
         installcommix
         pause
         kalitools ;;  
 
    "DBPwAudit")
          installDBPwAudit
          pause
          kalitools ;;  

    "DoonaDot")
          installDoonaDot
          pause
          kalitools ;; 
          
    "Greenbone Security")
          installgreenbonesecurity
          pause
          kalitools ;; 

    "DotPwn")
          installDotPwn
          pause
          kalitools ;;
          
    "GSD")
          installGSD
          pause
          kalitools ;;
            
    "hexorbase")
          installhexorbase
          pause 
          kalitools ;; 
            
    "Inguma")
          installInguma
          pause
          kalitools ;; 
   
    "jSQL")
          installjSQL
          pause 
          kalitools ;; 
              
    "Lynis")
          installLynis
          pause 
          kalitools ;; 

    "Nmap")
          installnmap
          pause 
          kalitools ;; 

    "ohrwurm") 
          installohrwurm
          pause 
          kalitools ;; 
                
    "openvas-administrator")
          installopenvas-administrator
          pause 
          kalitools ;; 

    "openvas-cli") 
          openvas-cli
          pause 
          kalitools ;; 

    "openvas-manager")
          installopenvas-manager
          pause 
          kalitools ;; 

    "openvas-scanner")
          installopenvas-scanner
          pause 
          kalitools ;; 

    "Oscanner")
          installoscanner
          pause 
          kalitools ;; 

    "Powerfuzzer")
          installpowerfuzzer
          pause 
          kalitools ;; 

    "sfuzz")
          installsfuzz
          pause 
          kalitools ;; 

    "sidguesser") 
          installsidguesser
          pause 
          kalitools ;; 

    "SIPArmyKnife")
          installsiparmyknife
          pause 
          kalitools ;; 

    "sqlmap")
          installsqlmap
          pause 
          kalitools ;; 

    "sqlninja")
          installsqlninja
          pause 
          kalitools ;; 
         
    "sqlsus")
          installsqlsus
          pause 
          kalitools ;; 
                  
    "thc-ipv6")
          installthc-ipv6
          pause  
          kalitools ;; 

    "tnscmd10g")
          installtnscmd10g
          pause 
          kalitools ;; 

    "unix-privesc-check")
          installunix-privesc-check
          pause 
          kalitools ;;
                    
    "yersinia")
          installyersinia
          pause 
          kalitools ;;

    
    "Install All")
          installall
          pause
          kalitools ;;      

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



##### aircrack-ng
function installaircrack-ng { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing aircrack-ng ============================\033[m"
	      sleep 2
          apt-get install aircrack-ng
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### asleap
function installasleap { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing asleap ============================\033[m"
	      sleep 2
          apt-get install asleap
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}


##### bluelog
function installbluelog { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing bluelog ============================\033[m"
	      sleep 2
          apt-get install bluelog
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### BlueMaho
function installBlueMaho { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing BlueMaho ============================\033[m"
	      sleep 2
          aapt-get install git && git clone git://git.kali.org/packages/bluemaho.git
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### Bluepot
function installBluepot { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing Bluepot ============================\033[m"
	      sleep 2
          apt-get install git && git clone git://git.kali.org/packages/bluepot.git
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### blueranger
function installblueranger { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing blueranger ============================\033[m"
	      sleep 2
          apt-get install blueranger
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### bluesnarfer
function installbluesnarfer { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing bluesnarfer ============================\033[m"
	      sleep 2
          apt-get install bluesnarfer
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### bully
function installbully { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing bully ============================\033[m"
	      sleep 2
          apt-get install bully
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### cowpatty
function installcowpatty { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing cowpatty ============================\033[m"
	      sleep 2
          apt-get install cowpatty
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### crackle
function installcrackle { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing crackle ============================\033[m"
	      sleep 2
          apt-get install crackle
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### eapmd5pass
function installeapmd5pass { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing eapmd5pass ============================\033[m"
	      sleep 2
          apt-get install eapmd5pass
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### fern-wifi-cracker
function installfern-wifi-cracker { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing fern-wifi-cracker ============================\033[m"
	      sleep 2
          apt-get install fern-wifi-cracker
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### ghost-phisher
function installghost-phisher { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing ghost-phisher ============================\033[m"
	      sleep 2
          apt-get install ghost-phisher
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### giskismet
function installgiskismet { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing giskismet ============================\033[m"
	      sleep 2
          apt-get install giskismet
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### gr-scan
function installgr-scan { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing gr-scan ============================\033[m"
	      sleep 2
          apt-get install git && git clone git://git.kali.org/packages/gr-scan.git
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### kalibrate-rtl
function installkalibrate-rtl { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing kalibrate-rtl ============================\033[m"
	      sleep 2
          apt-get install kalibrate-rtl
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### killerbee
function installkillerbee { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing killerbee ============================\033[m"
	      sleep 2
          apt-get install killerbee
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### kismet
function installkismet { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing kismet ============================\033[m"
	      sleep 2
          apt-get install kismet
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### mdk3
function installmdk3 { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing mdk3 ============================\033[m"
	      sleep 2
          apt-get install mdk3
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### mfcuk
function installmfcuk { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing mfcuk ============================\033[m"
	      sleep 2
          apt-get install mfcuk
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### mfoc
function installmfoc { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing mfoc ============================\033[m"
	      sleep 2
          apt-get install mfoc
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### mfterm
function installmfterm { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing mfterm ============================\033[m"
	      sleep 2
          apt-get install mfterm
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### multimon-ng
function installmultimon-ng { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing multimon-ng ============================\033[m"
	      sleep 2
          apt-get install multimon-ng
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### pixiewps
function installpixiewps { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing pixiewps ============================\033[m"
	      sleep 2
          apt-get install pixiewps
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### reaver
function installreaver { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing reaver ============================\033[m"
	      sleep 2
          apt-get install reaver
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### redfang
function installredfang { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing redfang ============================\033[m"
	      sleep 2
          apt-get install redfang
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### rtlsdr-scanner
function installrtlsdr-scanner { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing rtlsdr-scanner ============================\033[m"
	      sleep 2
          apt-get install rtlsdr-scanner
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### spooftooph
function installspooftooph { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing spooftooph ============================\033[m"
	      sleep 2
          apt-get install spooftooph
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### wifi-honey
function installwifi-honey { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing wifi-honey ============================\033[m"
	      sleep 2
          apt-get install wifi-honey
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### wifitap
function installwifitap { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing wifitap ============================\033[m"
	      sleep 2
          apt-get install wifitap
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### wifite
function installwifite { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing wifite ============================\033[m"
	      sleep 2
          apt-get install wifite
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}


##### Wireless Attacks
function wirelessattacks {
clear
echo -e "
\033[31m\033[m
\033[31m
Information Gathering

\033[m              
\033[31m\033[m"
select menusel in "Aircrack-ng" "Asleap" "Bluelog" "BlueMaho" "Bluepot" "BlueRanger" "Bluesnarfer" "Bully" "coWPAtty" "crackle" "eapmd5pass" "fern-wifi-cracker" "ghost-phisher" "giskismet" "gr-scan" "kalibrate-rtl" "killerbee" "kismet" "mdk3" "mfcuk" "mfoc" "mfterm" "multimon-ng" "pixiewps" "reaver" "redfang" "rtlsdr-scanner" "spooftooph" "wifi-honey" "wifitap" "wifite" "Install All" "Back to Main"; do
case $menusel in

    "Aircrack-ng") 
          installaircrack-ng
          pause 
          kalitools ;; 

    "Asleap")
          installasleap
          pause 
          kalitools ;;

    "Bluelog")
          installbluelog
          pause
          kalitools ;;

    "BlueMaho")
          installBlueMaho
          pause
          kalitools ;; 

    "Bluepot")
          installBluepot
          pause 
          kalitools ;;      
     
    "BlueRanger")
          installblueranger
          pause
          kalitools ;; 

    "Bluesnarfer")
          installbluesnarfer
          pause
          kalitools ;;

    "Bully")
          installbully
          pause 
          kalitools ;; 

    "coWPAtty")
          installcowpatty
          pause
          kalitools ;; 

    "crackle")
          installcrackle
          pause
          kalitools ;;       

    "eapmd5pass")
          installeapmd5pass
          pause
          kalitools ;; 
 
    "fern-wifi-cracker")
          installfern-wifi-cracker
          pause
          kalitools ;; 

    "ghost-phisher")
          installghost-phisher
          pause
          kalitools ;; 

    "giskismet")
          installgiskismet
          pause 
          kalitools ;;

    "gr-scan")
          installgr-scan
          pause
          kalitools ;; 

    "kalibrate-rtl")
          installkalibrate-rtl
          pause
          kalitools ;;

    "killerbee")
          installkillerbee
          pause 
          kalitools ;; 

    "kismet")      
          installkismet
          pause
          kalitools ;; 

    "mdk3")
          installmdk3
          pause
          kalitools ;;

    "mfcuk")
          installmfcuk
          pause
          kalitools ;;

    "mfoc")
          installmfoc
          pause
          kalitools ;; 

    "mfterm")
          installmfterm
          pause
          kalitools ;;     

    "multimon-ng")
          installmultimon-ng
          pause
          kalitools ;; 

    "pixiewps")
          installpixiewps
          pause
          kalitools ;; 

    "reaver")
          installreaver
          pause
          kalitools ;;   

    "redfang")
          installredfang
          pause
          kalitools ;; 

    "rtlsdr-scanner")
          installrtlsdr-scanner
          pause
          kalitools ;;      
    
    "spooftooph")
          installspooftooph
          pause
          kalitools ;; 
    
    "wifi-honey")
          installwifi-honey
          pause
          kalitools ;; 

    "wifitap")
          installwifitap
          pause
          kalitools ;;       

    "wifite")
          installwifite
          pause
          kalitools ;; 

    "Install All")
          installall
          pause
          kalitools ;;      

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

##### apache-users
function installapacheusers { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing apache-users ============================\033[m"
	      sleep 2
          apt-get install apache-users
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### arachni
function installarachni { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing arachni ============================\033[m"
	      sleep 2
          apt-get install arachni
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### bbqsql
function installbbqsql { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing bbqsql ============================\033[m"
	      sleep 2
          apt-get install bbqsql
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### blindelephant
function installblindelephant { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing blindelephant ============================\033[m"
	      sleep 2
          apt-get install blindelephant
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### burpsuite
function installburpsuite { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing burpsuite ============================\033[m"
	      sleep 2
          apt-get install burpsuite
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### cutycapt
function installcutycapt { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing cutycapt ============================\033[m"
	      sleep 2
          apt-get install cutycapt
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### commix
function installcommix { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing commix ============================\033[m"
	      sleep 2
          apt-get install git && git clone https://github.com/stasinopoulos/commix.git commix && cd commix && python ./commix.py --install
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### davtest
function installdavtest { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing davtest ============================\033[m"
	      sleep 2
          apt-get install davtest
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### deblaze
function installdeblaze { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing deblaze ============================\033[m"
	      sleep 2
          apt-get install deblaze
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### dirb
function installdirb { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing dirb ============================\033[m"
	      sleep 2
          apt-get install dirb
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### dirbuster
function installdirbuster { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing dirbuster ============================\033[m"
	      sleep 2
          apt-get install dirbuster
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### fimap
function installfimap { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing fimap ============================\033[m"
	      sleep 2
          apt-get install fimap
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### funkload
function installfunkload { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing funkload ============================\033[m"
	      sleep 2
          apt-get install funkload
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### grabber
function installgrabber { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing grabber ============================\033[m"
	      sleep 2
          apt-get install grabber
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### jboss-autopwn
function installjboss-autopwn { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing jboss-autopwn ============================\033[m"
	      sleep 2
          apt-get install jboss-autopwn
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### joomscan
function installjoomscan { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing joomscan ============================\033[m"
	      sleep 2
          apt-get install joomscan
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### jsql
function installjsql { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing jsql ============================\033[m"
	      sleep 2
          apt-get install jsql
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### maltego-teeth
function installmaltego-teeth { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing maltego-teeth ============================\033[m"
	      sleep 2
          apt-get install maltego-teeth
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### padbuster
function installpadbuster { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing padbuster ============================\033[m"
	      sleep 2
          apt-get install padbuster
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}


##### paros
function installparos { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing paros ============================\033[m"
	      sleep 2
          apt-get install paros
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### plecost
function installplecost { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing plecost ============================\033[m"
	      sleep 2
          apt-get install plecost
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### powerfuzzer
function installpowerfuzzer { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing powerfuzzer ============================\033[m"
	      sleep 2
          apt-get install powerfuzzer
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### proxystrike
function installproxystrike { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing proxystrike ============================\033[m"
	      sleep 2
          apt-get install proxystrike
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### recon-ng
function installrecon-ng { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing recon-ng ============================\033[m"
	      sleep 2
          apt-get install recon-ng
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### skipfish
function installskipfish { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing skipfish ============================\033[m"
	      sleep 2
          apt-get install skipfish
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### sqlmap
function installsqlmap { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing sqlmap ============================\033[m"
	      sleep 2
          apt-get install sqlmap
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}

##### sqlninja
function installsqlninja { 
          clear
	      echo""
	      echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				clear	
	      echo -e "\033[31m========================== Installing sqlninja ============================\033[m"
	      sleep 2
          apt-get install sqlninja
          echo -e "\e[32m[-] Done Installing!\e[0m"
          else
				clear
				echo -e $white"\e[32m[-]As You Wish !\e[0m"
			fi

}


##### Web Applications
function webapplications {
clear
echo -e "
\033[31m\033[m
\033[31m
Information Gathering

\033[m              
\033[31m\033[m"
select menusel in "apacheusers" "arachni" "bbqsql" "blindelephant" "burpsuite" "cutycapt" "commix" "davtest" "deblaze" "dirb" "dirbuster" "fimap" "funkload" "grabber" "jboss-autopwn" "joomscan" "jsql" "maltego-teeth" "padbuster" "paros" "plecost" "powerfuzzer" "proxystrike" "recon-ng" "skipfish" "sqlmap" "sqlninja" "Install All" "Back to Main"; do
case $menusel in
     
    "apacheusers")
         installapacheusers
         pause
         kalitools ;; 

    "arachni")
         installarachni
         pause
         kalitools ;; 

    "bbqsql")
         installbbqsql
         pause
         kalitools ;; 

    "blindelephant")
         installblindelephant
         pause
         kalitools ;; 

    "burpsuite")
         installburpsuite
         pause
         kalitools ;; 

    "cutycapt")
         installcutycapt
         pause
         kalitools ;;      
    
    "commix")
         installcommix
         pause
         kalitools ;; 

    "davtest")
         installdavtest
         pause
         kalitools ;; 

    "deblaze")
         installdeblaze
         pause
         kalitools ;;

    "dirb")
         installdirb
         pause
         kalitools ;; 
  
    "dirbuster")
         installdirbuster
         pause
         kalitools ;; 

    "fimap")
         installfimap
         pause
         kalitools ;;      
 
    "funkload")
         installfunkload
         pause
         kalitools ;;

    "grabber")
         installgrabber
         pause
         kalitools ;;  

    "jboss-autopwn") 
         installjboss-autopwn
         pause
         kalitools ;;           
      
    "joomscan")
         installjoomscan
         pause
         kalitools ;; 

    "jsql")
         installjsql
         pause
         kalitools ;;      


    "maltego-teeth")
         installmaltego-teeth
         pause
         kalitools ;; 
    
    "padbuster")
         installpadbuster
         pause
         kalitools ;; 

    "paros")
         installparos
         pause
         kalitools ;;  

    "plecost")
         installplecost
         pause
         kalitools ;; 

    "powerfuzzer")
         installpowerfuzzer
         pause
         kalitools ;; 
 
    "proxystrike")
         installproxystrike
         pause
         kalitools ;; 

    "recon-ng")
         installrecon-ng
         pause
         kalitools ;; 

    "skipfish")
         installskipfish
         pause
         kalitools ;;
    
    "sqlmap")
         installsqlmap
         pause
         kalitools ;; 

    "sqlninja")
         installsqlninja
         pause
         kalitools ;; 
         

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

### KALI - TOOLS 
function kalitools {
clear
echo -e "
\033[31m\033[m
\033[36m                
      

\033[36m
\033[31m\033[m"

select menusel in "Information Gathering" "Vulnerability Analysis" "Wireless Attacks" "Web Applications" "Sniffing & Spoofing" "Maintaining Access" "Reporting Tools" "Exploitation Tools" "Forensics Tools" "Stress Testing" "Password Attacks" "Reverse Engineering" "Hardware Hacking" "Install All" "Back to Main"; do
case $menusel in 

     "Information Gathering")
         infomationgathering
         clear ;; 

     "Vulnerability Analysis")
         vulnerabilityanalysis
         clear ;; 

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
.................MLMP...................
...........Shadow.<|>.Stream............
\033[m          Script by Moonlight
            Version : 0.1.0 \033[32m$version\033[m
\033[32m\033[m"

select menusel in "Update Kali" "Desktop Manager" "Update Tools" "Software and System Tools" "Install Hacking Tools" "Kali-Tools" "Check Gh4st-Update" "EXIT PROGRAM"; do
case $menusel in
	
    "Update Kali")
		updatekali
		clear ;;
	
	"Desktop Manager")
        Desktopmanager
        clear ;;

    "Update Tools")
        updatetools
        clear ;;

	"Software and System Tools")
		softwaresandystemtools
		clear ;;
	
	"Install Hacking Tools")
		hackingtools 
		clear ;;	
     
    "Kali-Tools")
        kalitools
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
