function reinstall_tools
{
while true
do
	cd
	clear
	TERMINALTITLE="INSTALL/REINSTALL A TOOL"
	dash_calc
	printf '\033]2;INSTALL/REINSTALL A TOOL\a'
	echo -e "Select a tool to install/reinstall"
	echo -e " "$YS"1"$CE") Fluxion      "$YS"21"$CE") 4nonimizer    "$YS"41"$CE") Infoga           "$YS"61"$CE") Wifi-Pumpkin"
	echo -e ""$YS" 2"$CE") Wifite       "$YS"22"$CE") Openvas       "$YS"42"$CE") nWatch           "$YS"62"$CE") Veil-Framework"
	echo -e ""$YS" 3"$CE") Wifiphisher  "$YS"23"$CE") BeeLogger     "$YS"43"$CE") Eternal scanner  "$YS"63"$CE") Leviathan"
	echo -e ""$YS" 4"$CE") Zatacker     "$YS"24"$CE") Ezsploit      "$YS"44"$CE") Eaphammer        "$YS"64"$CE") FakeImageExploiter"
	echo -e ""$YS" 5"$CE") Morpheus     "$YS"25"$CE") Pupy          "$YS"45"$CE") Dagon            "$YS"65"$CE") Avet"
	echo -e ""$YS" 6"$CE") Osrfconsole  "$YS"26"$CE") Zirikatu      "$YS"46"$CE") Lalin            "$YS"66"$CE") Gloom"
	echo -e ""$YS" 7"$CE") Hakku        "$YS"27"$CE") WiFi-autopwner"$YS"47"$CE") Knockmail        "$YS"67"$CE") Arcanus"
	echo -e ""$YS" 8"$CE") Trity        "$YS"28"$CE") Bully         "$YS"48"$CE") Kwetza           "$YS"68"$CE") MSFPC"
	echo -e ""$YS" 9"$CE") Cupp         "$YS"29"$CE") Anonsurf      "$YS"49"$CE") Ngrok            "$YS"69"$CE") MorphHTA"
	echo -e ""$YS"10"$CE") Dracnmap     "$YS"30"$CE") Anonym8       "$YS"50"$CE") Bleachbit        "$YS"70"$CE") LFISuite"
	echo -e ""$YS"11"$CE") Fern         "$YS"31"$CE") TheFatRat     "$YS"51"$CE") Vmr mdk          "$YS"71"$CE") UniByAv"
	echo -e ""$YS"12"$CE") Netdiscover  "$YS"32"$CE") Angry IP      "$YS"52"$CE") Hash Buster      "$YS"72"$CE") Demiguise"
	echo -e ""$YS"13"$CE") KickThemOut  "$YS"33"$CE") Sniper        "$YS"53"$CE") Findsploit       "$YS"73"$CE") Dkmc"
	echo -e ""$YS"14"$CE") Ghost-Phisher"$YS"34"$CE") ReconDog      "$YS"54"$CE") Howdoi           "$YS"74"$CE") MITMf"
	echo -e ""$YS"15"$CE") The Eye      "$YS"35"$CE") RED HAWK      "$YS"55"$CE") Operative-frmwork"$YS"75"$CE") Netool-toolkit"
	echo -e ""$YS"16"$CE") Xerxes       "$YS"36"$CE") WinPayloads   "$YS"56"$CE") Netattack2       "$YS"76"$CE") Patator"
	echo -e ""$YS"17"$CE") Mdk3-master  "$YS"37"$CE") Shellter      "$YS"57"$CE") Koadic           "$YS"77"$CE") Evil-Droid"
	echo -e ""$YS"18"$CE") Katana       "$YS"38"$CE") CHAOS         "$YS"58"$CE") Empire           "$YS"78"$CE") NoSQLMap"
	echo -e ""$YS"19"$CE") Airgeddon    "$YS"39"$CE") Routersploit  "$YS"59"$CE") Meterpr.-Paranoid"
	echo -e ""$YS"20"$CE") Websploit    "$YS"40"$CE") Geany         "$YS"60"$CE") Dr0p1t"
	echo -e ""$YS" b"$CE") Go back"
	echo -e ""$YS" 0"$CE") Exit"
	echo -e "Choose: "
	read REIN
	clear
	if [[ "$REIN" = "1" ]]
	then
		install_fluxion		
	elif [[ "$REIN" = "2" ]]
	then
		install_wifite
	elif [[ "$REIN" = "3" ]]
	then
		install_wifiphisher
	elif [[ "$REIN" = "4" ]]
	then
		install_zatacker
	elif [[ "$REIN" = "5" ]]
	then
		install_morpheus
	elif [[ "$REIN" = "6" ]]
	then
		install_osrframework			
	elif [[ "$REIN" = "7" ]]
	then
		install_hakku
	elif [[ "$REIN" = "8" ]]
	then
		install_trity
	elif [[ "$REIN" = "9" ]]
	then
		install_cupp
	elif [[ "$REIN" = "10" ]]
	then
		install_dracnmap
	elif [[ "$REIN" = "11" ]]
	then
		install_fern
	elif [[ "$REIN" = "12" ]]
	then
		install_netdiscover		
	elif [[ "$REIN" = "13" ]]
	then
		install_kickthemout
	elif [[ "$REIN" = "14" ]]
	then
		install_ghostphisher
	elif [[ "$REIN" = "15" ]]
	then
		install_theeye
	elif [[ "$REIN" = "16" ]]
	then
		install_xerxes
	elif [[ "$REIN" = "17" ]]
	then
		install_mdk3
	elif [[ "$REIN" = "18" ]]
	then
		install_katana
	elif [[ "$REIN" = "19" ]]
	then
		install_airgeddon
	elif [[ "$REIN" = "20" ]]
	then
		install_websploit
	elif [[ "$REIN" = "21" ]]
	then
		install_4nonimizer
	elif [[ "$REIN" = "22" ]]
	then
		install_openvas
	elif [[ "$REIN" = "23" ]]
	then
		install_beelogger
	elif [[ "$REIN" = "24" ]]
	then
		install_ezsploit
	elif [[ "$REIN" = "25" ]]
	then
		install_pupy
	elif [[ "$REIN" = "26" ]]
	then
		install_zirikatu
	elif [[ "$REIN" = "27" ]]
	then
		install_wifiautopwner
	elif [[ "$REIN" = "28" ]]
	then
		install_bully
	elif [[ "$REIN" = "29" ]]
	then
		install_anonsurf
	elif [[ "$REIN" = "30" ]]
	then
		install_anonym8
	elif [[ "$REIN" = "31" ]]
	then	
		install_thefatrat
	elif [[ "$REIN" = "32" ]]
	then
		install_angryip
	elif [[ "$REIN" = "33" ]]
	then
		install_sniper
	elif [[ "$REIN" = "34" ]]
	then
		install_recondog
	elif [[ "$REIN" = "35" ]]
	then
		install_redhawk
	elif [[ "$REIN" = "36" ]]
	then
		install_winpayloads
	elif [[ "$REIN" = "37" ]]
	then
		install_shellter
	elif [[ "$REIN" = "38" ]]
	then
		install_chaos
	elif [[ "$REIN" = "39" ]]
	then
		install_routersploit
	elif [[ "$REIN" = "40" ]]
	then
		install_geany
	elif [[ "$REIN" = "41" ]]
	then
		install_infoga
	elif [[ "$REIN" = "42" ]]
	then
		install_nwatch
	elif [[ "$REIN" = "43" ]]
	then
		install_eternalscanner
	elif [[ "$REIN" = "44" ]]
	then
		install_eaphammer
	elif [[ "$REIN" = "45" ]]
	then
		install_dagon
	elif [[ "$REIN" = "46" ]]
	then
		install_lalin
	elif [[ "$REIN" = "47" ]]
	then
		install_knockmail
	elif [[ "$REIN" = "48" ]]
	then
		install_kwetza
	elif [[ "$REIN" = "49" ]]
	then
		install_ngrok
	elif [[ "$REIN" = "50" ]]
	then
		install_bleachbit
	elif [[ "$REIN" = "51" ]]
	then
		install_vmr
	elif [[ "$REIN" = "52" ]]
	then
		install_hashbuster
	elif [[ "$REIN" = "53" ]]
	then
		install_findsploit
	elif [[ "$REIN" = "54" ]]
	then
		install_howdoi
	elif [[ "$REIN" = "55" ]]
	then
		install_operative
	elif [[ "$REIN" = "56" ]]
	then
		install_netattack2
	elif [[ "$REIN" = "57" ]]
	then
		install_koadic
	elif [[ "$REIN" = "58" ]]
	then
		install_empire
	elif [[ "$REIN" = "59" ]]
	then
		install_meterpreter_paranoid_mode
	elif [[ "$REIN" = "60" ]]
	then
		install_dropit_frmw
	elif [[ "$REIN" = "61" ]]
	then
		install_wifi_pumpkin
	elif [[ "$REIN" = "62" ]]
	then
		install_veil
	elif [[ "$REIN" = "63" ]]
	then
		install_leviathan
	elif [[ "$REIN" = "64" ]]
	then
		install_fake_image
	elif [[ "$REIN" = "65" ]]
	then
		install_avet
	elif [[ "$REIN" = "66" ]]
	then
		install_gloom
	elif [[ "$REIN" = "67" ]]
	then
		install_arcanus
	elif [[ "$REIN" = "68" ]]
	then
		install_msfpc
	elif [[ "$REIN" = "69" ]]
	then
		install_morphhta
	elif [[ "$REIN" = "70" ]]
	then
		install_lfi
	elif [[ "$REIN" = "71" ]]
	then
		install_unibyav
	elif [[ "$REIN" = "72" ]]
	then
		install_demiguise
	elif [[ "$REIN" = "73" ]]
	then
		install_dkmc
	elif [[ "$REIN" = "74" ]]
	then
		install_mitmf
	elif [[ "$REIN" = "75" ]]
	then
		install_netool
	elif [[ "$REIN" = "76" ]]
	then
		install_patator
	elif [[ "$REIN" = "77" ]]
	then
		install_evil_droid
	elif [[ "$REIN" = "78" ]]
	then
		install_nosqlmap
	elif [[ "$REIN" = "back" || "$REIN" = "b" ]]
	then
		clear
		break
	elif [[ "$REIN" = "00" ]]
	then	
		exec bash "$0"
	elif [[ "$REIN" = "0" ]]
	then
		clear
		exit
	fi
	done
}
