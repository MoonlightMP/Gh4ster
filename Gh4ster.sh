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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
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

select menusel in   "Masscan" "Morpheus" "bettercap" "Commix" "seclist" "Fluxion" "Mitmf" "Backdoor-Factory" "Wig" "Spade" "Nettool" "Thad0ctor" "Hackpack" "Atscan" "OpenDoor" "Whitewidow" "Unicorn" "Metagofil" "XSSER" "Pyobfuscate" "Install All" "Back to Main"; do
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
................ MLMP...................
...........Shadow.<|>.Stream............
\033[m                                        
          Script by Moonlight
            Version : 0.0.9 \033[32m$version\033[m
\033[32m\033[m"

select menusel in "Update Kali" "Desktop Manager" "Update Tools" "Software and System Tools" "Install Hacking Tools" "Check Gh4st-Update" "EXIT PROGRAM"; do
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
