#!/bin/bash
clear && clear
cd $HOME
RutaBin="/bin"
apt install net-tools -y &>/dev/null
myip=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1)
myint=$(ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}')
rm -rf /etc/localtime &>/dev/null
ln -s /usr/share/zoneinfo/America/Mexico_City /etc/localtime &>/dev/null
rm -rf /usr/local/lib/systemubu1 &>/dev/null
### COLORES Y BARRA
msg() {
  BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
  AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' && NEGRITO='\e[1m' && SEMCOR='\e[0m'
  case $1 in
  -ne) cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -ama) cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verm) cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -azu) cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verd) cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -bra) cor="${VERMELHO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  "-bar2" | "-bar") cor="${VERMELHO}————————————————————————————————————————————————————" && echo -e "${SEMCOR}${cor}${SEMCOR}" ;;
  esac
}
fun_bar () {
#==comando a ejecutar==
comando="$1"
#==interfas==
in=' ['
en=' ] '
full_in="➛"
full_en='100%'
bar=(────────────────────
═───────────────────
▇═──────────────────
▇▇═─────────────────
═▇▇═────────────────
─═▇▇═───────────────
──═▇▇═──────────────
───═▇▇═─────────────
────═▇▇═────────────
─────═▇▇═───────────
──────═▇▇═──────────
───────═▇▇═─────────
────────═▇▇═────────
─────────═▇▇═───────
──────────═▇▇═──────
───────────═▇▇═─────
────────────═▇▇═────
─────────────═▇▇═───
──────────────═▇▇═──
───────────────═▇▇═─
────────────────═▇▇═
─────────────────═▇▇
──────────────────═▇
───────────────────═
──────────────────═▇
─────────────────═▇▇
────────────────═▇▇═
───────────────═▇▇═─
──────────────═▇▇═──
─────────────═▇▇═───
────────────═▇▇═────
───────────═▇▇═─────
──────────═▇▇═──────
─────────═▇▇═───────
────────═▇▇═────────
───────═▇▇═─────────
──────═▇▇═──────────
─────═▇▇═───────────
────═▇▇═────────────
───═▇▇═─────────────
──═▇▇═──────────────
─═▇▇═───────────────
═▇▇═────────────────
▇▇═─────────────────
▇═──────────────────
═───────────────────
────────────────────);
#==color==
in="\033[1;33m$in\033[0m"
en="\033[1;33m$en\033[0m"
full_in="\033[1;31m$full_in"
full_en="\033[1;32m$full_en\033[0m"

 _=$(
$comando > /dev/null 2>&1
) & > /dev/null
pid=$!
while [[ -d /proc/$pid ]]; do
	for i in "${bar[@]}"; do
		echo -ne "\r $in"
		echo -ne "ESPERE $en $in \033[1;31m$i"
		echo -ne " $en"
		sleep 0.1
	done
done
echo -e " $full_in $full_en"
sleep 0.1s
}

echo ""
echo -e "\033[97m    ◽️ INTENTANDO DETENER UPDATER SECUNDARIO " 
fun_bar " killall apt apt-get > /dev/null 2>&1 "
echo -e "\033[97m    ◽️ INTENTANDO RECONFIGURAR UPDATER "
fun_bar " dpkg --configure -a > /dev/null 2>&1 "
echo -e "\033[97m    ◽️ INSTALANDO S-P-C "
fun_bar " apt-get install software-properties-common -y > /dev/null 2>&1"
echo -e "\033[97m    ◽️ INSTALANDO LIBRERIA UNIVERSAL "
fun_bar " sudo apt-add-repository universe -y > /dev/null 2>&1"
echo -e "\033[97m    ◽️ INSTALANDO PYTHON "
fun_bar " sudo apt-get install python -y > /dev/null 2>&1"
apt-get install python -y &>/dev/null
echo -e "\033[97m    ◽️ INSTALANDO NET-TOOLS "
fun_bar "apt-get install net-tools -y > /dev/null 2>&1"
apt-get install net-tools -y &>/dev/null
apt-get install curl -y > /dev/null 2>&1
service ssh restart > /dev/null 2>&1
echo -e "\033[97m    ◽️ DESACTIVANDO PASS ALFANUMERICO "
sed -i 's/.*pam_cracklib.so.*/password sufficient pam_unix.so sha512 shadow nullok try_first_pass #use_authtok/' /etc/pam.d/common-password > /dev/null 2>&1 
fun_bar "service ssh restart > /dev/null 2>&1 "
msg -bar2


clear
install_paketes() {
  clear && clear
  ### PAQUETES PRINCIPALES
  msg -bar2
echo -e " \e[5m\033[1;100m   =====>> ►►  🖥️  SCRIPT | DANSMX  🖥️  ◄◄ <<=====   \033[1;37m"
  msg -bar
  echo -e "\033[97m"
  echo -e "  \033[41m    =====>>>> INSTALANDO <<<<=====    \e[49m"
  echo -e "\033[97m"
  msg -bar
  #grep
  apt-get install netcat -y &>/dev/null
  apt-get install netpipes -y &>/dev/null
  apt-get install grep -y &>/dev/null
  apt-get install net-tools -y &>/dev/null
  sudo add-apt-repository universe &>/dev/null
  sudo apt-get install netcat-traditional -y &>/dev/null
  sudo add-apt-repository main -y &>/dev/null
  sudo add-apt-repository universe -y &>/dev/null
  sudo add-apt-repository restricted -y &>/dev/null
  sudo add-apt-repository multiverse -y &>/dev/null
  sudo apt-get install software-properties-common -y &>/dev/null
  sudo add-apt-repository ppa:neurobin/ppa -y &>/dev/null
  sudo apt-get install build-essential -y &>/dev/null
  apt-get install shc &>/dev/null
  [[ $(dpkg --get-selections | grep -w "grep" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "grep" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install grep............ $ESTATUS "
  #gawk
  apt-get install gawk -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "gawk" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "gawk" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install gawk............ $ESTATUS "
  #mlocate
  apt-get install mlocate -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "mlocate" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "mlocate" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install mlocate......... $ESTATUS "
  #lolcat gem
  apt-get install lolcat -y &>/dev/null
  sudo gem install lolcat &>/dev/null
  [[ $(dpkg --get-selections | grep -w "lolcat" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "lolcat" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install lolcat.......... $ESTATUS "
  #at
  [[ $(dpkg --get-selections | grep -w "at" | head -1) ]] || apt-get install at -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "at" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "at" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install at.............. $ESTATUS "
  #nano
  [[ $(dpkg --get-selections | grep -w "nano" | head -1) ]] || apt-get install nano -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "nano" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "nano" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install nano............ $ESTATUS "
  #bc
  [[ $(dpkg --get-selections | grep -w "bc" | head -1) ]] || apt-get install bc -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "bc" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "bc" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  systemedia &>/dev/null
  echo -e "\033[97m    # apt-get install bc.............. $ESTATUS "
  #lsof
  [[ $(dpkg --get-selections | grep -w "lsof" | head -1) ]] || apt-get install lsof -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "lsof" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "lsof" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install lsof............ $ESTATUS "
  #figlet
  [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] || apt-get install figlet -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install figlet.......... $ESTATUS "
  #cowsay
  [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] || apt-get install cowsay -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install cowsay.......... $ESTATUS "
  #screen
  [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] || apt-get install screen -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install screen.......... $ESTATUS "
  #python
  [[ $(dpkg --get-selections | grep -w "python" | head -1) ]] || apt-get install python -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install python.......... $ESTATUS "
  #python3
  [[ $(dpkg --get-selections | grep -w "python3" | head -1) ]] || apt-get install python3 -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python3" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python3" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install python3......... $ESTATUS "
  #python3-pip
  [[ $(dpkg --get-selections | grep -w "python3-pip" | head -1) ]] || apt-get install python3-pip -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python3-pip" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python3-pip" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install python3-pip..... $ESTATUS "
  #ufw
  [[ $(dpkg --get-selections | grep -w "ufw" | head -1) ]] || apt-get install ufw -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "ufw" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "ufw" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install ufw............. $ESTATUS "
  #unzip
  [[ $(dpkg --get-selections | grep -w "unzip" | head -1) ]] || apt-get install unzip -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "unzip" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "unzip" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install unzip........... $ESTATUS "
  #zip
  [[ $(dpkg --get-selections | grep -w "zip" | head -1) ]] || apt-get install zip -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "zip" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "zip" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install zip............. $ESTATUS "
  #apache2
  apt-get install apache2 -y &>/dev/null
  sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf >/dev/null 2>&1
  service apache2 restart >/dev/null 2>&1
  [[ $(dpkg --get-selections | grep -w "apache2" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "apache2" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install apache2......... $ESTATUS "

}
clear && clear
  msg -bar
  echo -ne "\033[1;97m Digite su slogan: \033[1;32m" && read slogan
  tput cuu1 && tput dl1
  echo -e "$slogan"
  msg -bar
  clear && clear
mkdir /etc/VPS-MX >/dev/null 2>&1

cd /etc/VPS-MX
wget https://raw.githubusercontent.com/DanssBot/VPS-MX-8.5-Sin-Key/main/SCRIPT-8.4/VPS-MX.tar.xz >/dev/null 2>&1
tar -xf VPS-MX.tar.xz >/dev/null 2>&1
chmod +x VPS-MX.tar.xz >/dev/null 2>&1
rm -rf VPS-MX.tar.xz
cd
chmod -R 755 /etc/VPS-MX
rm -rf /etc/VPS-MX/MEUIPvps
echo "/etc/VPS-MX/menu" >/usr/bin/menu && chmod +x /usr/bin/menu
echo "/etc/VPS-MX/menu" >/usr/bin/VPSMX && chmod +x /usr/bin/VPSMX
echo "$slogan" >/etc/VPS-MX/message.txt
[[ ! -d /usr/local/lib ]] && mkdir /usr/local/lib
[[ ! -d /usr/local/lib/ubuntn ]] && mkdir /usr/local/lib/ubuntn
[[ ! -d /usr/local/lib/ubuntn/apache ]] && mkdir /usr/local/lib/ubuntn/apache
[[ ! -d /usr/local/lib/ubuntn/apache/ver ]] && mkdir /usr/local/lib/ubuntn/apache/ver
[[ ! -d /usr/share ]] && mkdir /usr/share
[[ ! -d /usr/share/mediaptre ]] && mkdir /usr/share/mediaptre
[[ ! -d /usr/share/mediaptre/local ]] && mkdir /usr/share/mediaptre/local
[[ ! -d /usr/share/mediaptre/local/log ]] && mkdir /usr/share/mediaptre/local/log
[[ ! -d /usr/share/mediaptre/local/log/lognull ]] && mkdir /usr/share/mediaptre/local/log/lognull
[[ ! -d /etc/VPS-MX/B-VPS-MXuser ]] && mkdir /etc/VPS-MX/B-VPS-MXuser
[[ ! -d /usr/local/protec ]] && mkdir /usr/local/protec
[[ ! -d /usr/local/protec/rip ]] && mkdir /usr/local/protec/rip
[[ ! -d /etc/protecbin ]] && mkdir /etc/protecbin
cd
[[ ! -d /etc/VPS-MX/v2ray ]] && mkdir /etc/VPS-MX/v2ray
[[ ! -d /etc/VPS-MX/Slow ]] && mkdir /etc/VPS-MX/Slow
[[ ! -d /etc/VPS-MX/Slow/install ]] && mkdir /etc/VPS-MX/Slow/install
[[ ! -d /etc/VPS-MX/Slow/Key ]] && mkdir /etc/VPS-MX/Slow/Key
msg -ama "               Finalizando Instalacion" && msg bar2

NOTIFY () { 
 clear 
 clear 
 msg -bar 
 msg -ama " Notify-BOT (Notificasion Remota)|@LaCasitaMx_Noty_Bot " 
 msg -bar 
 echo -e "\033[1;94m Notify-BOT es un simple notificador de:" 
 echo -e "\033[1;94m >> Usuario Expirado" 
 echo -e "\033[1;94m >> Usuario Eliminado" 
 echo -e "\033[1;94m >> Avisos de VPS Reiniciada" 
 echo -e "\033[1;94m >> Avisos de Monitor de Protocolos" 
 echo -e "\033[1;97m Inicie El BOT de Telegram" 
 echo -e "\033[1;92m ¡¡ Para sacar su ID entre al BOT @conectedmx_bot" 
 echo -e "\033[1;92m Aparesera algo parecido 👤 → Tu ID es: 45145564   " 
 msg -bar 
 echo -e "\033[1;93mIgrese un nombre para el VPS:\033[0;37m"; read -p " " nombr 
 echo "${nombr}" > /etc/VPS-MX/controlador/nombre.log 
 echo -e "\033[1;93mIgrese su ID 👤:\033[0;37m"; read -p " " idbot 
 echo "${idbot}" > /etc/VPS-MX/controlador/IDT.log 
 msg -bar 
 echo -e "\033[1;32m              ID AGREGADO CON EXITO" 
 msg -bar 
 wget -qO- ifconfig.me > /etc/VPS-MX/IP.log 
 ipt=`less /etc/VPS-MX/IP.log` > /dev/null 2>&1 
 Nip="$(echo $ipt)" 
 NOM="$(less /etc/VPS-MX/controlador/nombre.log)" 
 NOM1="$(echo $NOM)" 
 IDB1=`less /etc/VPS-MX/controlador/IDT.log` > /dev/null 2>&1 
 IDB2=`echo $IDB1` > /dev/null 2>&1 
 KEY="2012880601:AAEJ3Kk18PGDzW57LpTMnVMn_pQYQKW3V9w" 
 URL="https://api.telegram.org/bot$KEY/sendMessage" 
 MSG="⚠️ ►► AVISO DE VPS: $NOM1 ⚠ 
 👉 ►► IP: $Nip 
 👉 ►► MENSAJE DE PRUEBA 
 🔰 ►► NOTI-BOT ACTIVADO CORRECTAMENTE" 
 curl -s --max-time 10 -d "chat_id=$IDB2&disable_web_page_preview=1&text=$MSG" $URL &>/dev/null 
 echo -e "\033[1;34m            SE ENVIO MENSAJE DE PRUEBA " 
 } 

touch /usr/share/lognull &>/dev/null
wget -O /bin/resetsshdrop https://raw.githubusercontent.com/DanssBot/VPS-MX-8.5-Sin-Key/main/SCRIPT-8.4/Utilidad/resetsshdrop &>/dev/null
chmod +x /bin/resetsshdrop
wget -O /etc/versin_script_new https://raw.githubusercontent.com/DanssBot/VPS-MX-8.5-Sin-Key/main/SCRIPT-8.4/Vercion &>/dev/null
grep -v "^PasswordAuthentication" /etc/ssh/sshd_config >/tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >>/etc/ssh/sshd_config
rm -rf /usr/local/lib/systemubu1 &>/dev/null
rm -rf /etc/versin_script &>/dev/null
v1=$(curl -sSL "https://raw.githubusercontent.com/DanssBot/VPS-MX-8.5-Sin-Key/main/SCRIPT-8.4/Vercion") 
echo "$v1" > /etc/versin_script
wget -O /etc/versin_script_new https://raw.githubusercontent.com/DanssBot/VPS-MX-8.5-Sin-Key/main/SCRIPT-8.4/Vercion &>/dev/null
echo '#!/bin/sh -e' >/etc/rc.local
sudo chmod +x /etc/rc.local
echo "sudo resetsshdrop" >>/etc/rc.local
echo "sleep 2s" >>/etc/rc.local
echo "exit 0" >>/etc/rc.local
/bin/cp /etc/skel/.bashrc ~/
echo 'clear && clear' >>.bashrc
echo 'rebootnb login >/dev/null 2>&1' >>.bashrc
echo 'echo -e "\033[1;31m————————————————————————————————————————————————————" ' >>.bashrc
echo 'echo -e "\033[1;93m════════════════════════════════════════════════════" ' >>.bashrc
echo 'figlet -w 85 -f smslant "         SCRIPT
     DANSMX"   | lolcat' >>.bashrc
echo 'echo -e "\033[1;93m════════════════════════════════════════════════════" ' >>.bashrc
echo 'echo -e "\033[1;31m————————————————————————————————————————————————————" ' >>.bashrc
echo 'mess1="$(less /etc/VPS-MX/message.txt)" ' >>.bashrc
echo 'echo "" ' >>.bashrc
echo 'echo -e "\033[92m        VERSION : $ver "'>> .bashrc
echo 'echo -e "\t\033[92m -->>SLOGAN 🇲🇽: $mess1 "' >>.bashrc
echo 'echo "" ' >>.bashrc
echo 'echo -e "	\e[44;1;37mNombre del Servidor\e[0m : \e[1;33m $HOSTNAME \e[0m"' >> .bashrc
echo 'echo -e "	\e[44;1;37mFecha del Servidor\e[0m : \e[1;33m $DATE \e[0m"' >> .bashrc
echo 'echo -e "	\e[44;1;37mHora del Servidor\e[0m : \e[1;33m $TIME \e[0m"' >> .bashrc
echo 'echo -e ""' >> .bashrc
echo 'echo -e "\t\033[97mMOSTRAR PANEL BASH ESCRIBA: sudo VPSMX o menu "' >>.bashrc
echo 'echo ""' >>.bashrc
echo -e "         COMANDO PRINCIPAL PARA ENTRAR AL PANEL "
echo -e "  \033[1;41m               sudo VPSMX o menu            \033[0;37m" && msg -bar2
echo -e "${cor[2]}         DESEAS INSTALAR NOTI-BOT?(Default n)" 
 echo -e "\033[1;34m  (Deves tener Telegram y el BOT: @LaCasitaMx_Noty_Bot)" 
 msg -bar2 
 read -p " [ s | n ]: " NOTIFY 
 [[ "$NOTIFY" = "s" || "$NOTIFY" = "S" ]] && NOTIFY 
 msg -bar2 
   [[ ${byinst} = "true" ]] && install_fim
rm -rf /usr/bin/pytransform &>/dev/null
rm -rf VPS-MX.sh
rm -rf lista-arq
service ssh restart &>/dev/null
