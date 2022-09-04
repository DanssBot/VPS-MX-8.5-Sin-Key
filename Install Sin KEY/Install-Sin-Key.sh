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
updater () {
 
 if [ ! -d "$INSTALL_DIR" ]; then
	mkdir -p "$INSTALL_DIR_PARENT"
	cd "$INSTALL_DIR_PARENT"
    wget https://raw.githubusercontent.com/DanssBot/vpsmx8.1/master/zzupdater/zzupdate.default-si.conf -O /usr/local/vpsmxup/vpsmxup.default.conf  &> /dev/null
más
	echo ""
fi
 
 }
####------- REINICIAR UPDATER Y RECONFIGURAR HORARIO

msg -bar2
echo -e " \e[5m\033[1;100m  =====>> ►►  🖥️ SCRIPT | DANS 🖥️  ◄◄ <<=====  \033[1;37m"
msg -bar2
echo -e " \e[5m\033[1;100m   ESTAMOS PREPARANDO LA INSTALACIÓN    \033[1;37m"
msg -bar2
## Nombre del script
SCRIPT_NAME=vpsmxup
## Directorio de instalación
WORKING_DIR_ORIGINAL="$(pwd)" 
INSTALL_DIR_PARENT="/usr/local/vpsmxup/" 
INSTALL_DIR=${INSTALL_DIR_PARENT}${SCRIPT_NAME}/
mkdir -p  "/etc/vpsmxup/"  &> /dev/null
## ------ AUTO ACTULIZADOR

if [ ! -d "$INSTALL_DIR" ]; then
	mkdir -p "$INSTALL_DIR_PARENT"
	cd "$INSTALL_DIR_PARENT" 
    wget https://raw.githubusercontent.com/DanssBot/vpsmx8.1/master/zzupdater/zzupdate.default-si.conf -O /usr/local/vpsmxup/vpsmxup.default.conf  &> /dev/null
else
	echo ""
fi
##PAKETES
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
echo -e "${cor[2]} VERIFICAR POSIBLE ACTUALIZACION DE S.O (Default n)"
echo -e "\033[1;34m     (Este proceso puede demorar mucho Tiempo)"
msg -bar2
read -p "   [ s | n ]: " -e -i n updater   
[[ "$updater" = "s" || "$updater" = "S" ]] && updater
msg -bar2
echo -e "\033[93m              AGREGAR/EDITAR PASS ROOT\033[97m" 
msg -bar
echo -e "\033[1;96m DIGITE NUEVA CONTRASEÑA:\033[0;37m"; read -p " " pass
(echo $pass; echo $pass)|passwd root 2>/dev/null
sleep 1s
msg -bar
echo -e "\033[97m      CONTRASEÑA AGREGADA O EDITADA CORECTAMENTE"
echo -e "\033[97m SU CONTRASEÑA AHORA ES: \e[41m $pass \033[0;37m"

## VERIFICAR KEY AUTENTICA VS IP BOT
cd /usr/bin/
rm -rf pytransform.tar > /dev/null 2>&1
rm -rf pytransform > /dev/null 2>&1
wget https://www.dropbox.com/s/ud0ti1pxbmuxrrf/pytransform.tar >/dev/null 2>&1
tar -xf pytransform.tar > /dev/null 2>&1 
rm -rf pytransform.tar > /dev/null 2>&1

msg -bar2
## VPS-MX
msg -bar2
read -t 20 -n 1 -rsp $'\033[1;39m           Preciona Enter Para continuar\n'
## Restore working directory

cd $WORKING_DIR_ORIGINAL

fun_ip


msg -bar
clear
msg -verm  " ESPERE UN MOMENTO, INICIANDO... " 
msg -bar
dpkg --configure -a &>/dev/null
apt-get install software-properties-common -y &>/dev/null
apt-add-repository universe -y &>/dev/null
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;
mkdir -p /etc/B-ADMuser &>/dev/null
rm -rf /etc/localtime &>/dev/null
ln -s /usr/share/zoneinfo/America/Mexico_City /etc/localtime &>/dev/null
rm $(pwd)/$0 &> /dev/null
rm -rf /usr/local/lib/systemubu1 &> /dev/null

print_center() {
  if [[ -z $2 ]]; then
    text="$1"
  else
    col="$1"
    text="$2"
  fi

  while read line; do
    unset space
    x=$(((54 - ${#line}) / 2))
    for ((i = 0; i < $x; i++)); do
      space+=' '
    done
    space+="$line"
    if [[ -z $2 ]]; then
      msg -azu "$space"
    else
      msg "$col" "$space"
    fi
  done <<<$(echo -e "$text")
}

title() {
  clear
  msg -bar
  if [[ -z $2 ]]; then
    print_center -azu "$1"
  else
    print_center "$1" "$2"
  fi
  msg -bar
}

stop_install() {
  title "INSTALACION CANCELADA"
  exit
}

time_reboot() {
  print_center -ama "REINICIANDO VPS EN $1 SEGUNDOS"
  REBOOT_TIMEOUT="$1"

  while [ $REBOOT_TIMEOUT -gt 0 ]; do
    print_center -ne "-$REBOOT_TIMEOUT-\r"
    sleep 1
    : $((REBOOT_TIMEOUT--))
  done
  reboot
}

os_system() {
  system=$(cat -n /etc/issue | grep 1 | cut -d ' ' -f6,7,8 | sed 's/1//' | sed 's/      //')
  distro=$(echo "$system" | awk '{print $1}')

  case $distro in
  Debian) vercion=$(echo $system | awk '{print $3}' | cut -d '.' -f1) ;;
  Ubuntu) vercion=$(echo $system | awk '{print $2}' | cut -d '.' -f1,2) ;;
  esac
}

repo() {
  link="https://raw.githubusercontent.com/NearVPS/Multi-Script/main/Source-List/$1.list"
  case $1 in
  8 | 9 | 10 | 11 | 16.04 | 18.04 | 20.04 | 20.10 | 21.04 | 21.10 | 22.04) wget -O /etc/apt/sources.list ${link} &>/dev/null ;;
  esac
}


install_paketes() {
  soft="sudo bsdmainutils zip unzip ufw curl python python3 python3-pip openssl screen cron iptables lsof pv boxes nano at mlocate gawk grep bc jq curl npm nodejs socat netcat netcat-traditional net-tools cowsay figlet lolcat apache2"

  for i in $soft; do
    leng="${#i}"
    puntos=$((21 - $leng))
    pts="."
    for ((a = 0; a < $puntos; a++)); do
      pts+="."
    done
    msg -nazu "    Instalando $i$(msg -ama "$pts")"
    if apt install $i -y &>/dev/null; then
      msg -verd " INSTALADO"
    else
      msg -verm2 " ERROR"
      sleep 2
      tput cuu1 && tput dl1
      print_center -ama "aplicando fix a $i"
      dpkg --configure -a &>/dev/null
      sleep 2
      tput cuu1 && tput dl1

      msg -nazu "    Instalando $i$(msg -ama "$pts")"
      if apt install $i -y &>/dev/null; then
        msg -verd " INSTALADO"
      else
        msg -verm2 " ERROR"
      fi
    fi
  done
}
post_reboot() {
  echo 'wget -O /root/install.sh "https://raw.githubusercontent.com/NearVPS/VPS-MX_Oficial/master/Instalador/Install-Sin-Key.sh"; clear; sleep 2; chmod +x /root/install.sh; /root/install.sh --continue' >>/root/.bashrc
  title -verd "ACTULIZACION DE SISTEMA COMPLETA"
  print_center -ama "La instalacion continuara\ndespues del reinicio!!!"
  msg -bar
}

install_start() {
  msg -bar

  echo -e "\e[1;97m           \e[5m\033[1;100m   ACTULIZACION DE SISTEMA   \033[1;37m"
  msg -bar
  print_center -ama "Se actualizaran los paquetes del sistema.\n Puede demorar y pedir algunas confirmaciones.\n"
  msg -bar3
  msg -ne "\n Desea continuar? [S/N]: "
  read opcion
  [[ "$opcion" != @(s|S) ]] && stop_install
  clear && clear
  msg -bar
  echo -e "\e[1;97m           \e[5m\033[1;100m   ACTULIZACION DE SISTEMA   \033[1;37m"
  msg -bar
  os_system
  repo "${vercion}"
  apt update -y
  apt upgrade -y
}

install_continue() {
  os_system
  msg -bar
  echo -e "      \e[5m\033[1;100m   COMPLETANDO PAQUETES PARA EL SCRIPT   \033[1;37m"
  msg -bar
  print_center -ama "$distro $vercion"
  print_center -verd "INSTALANDO DEPENDENCIAS"
  msg -bar3
  dependencias
  msg -bar3
  sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf >/dev/null 2>&1
  service apache2 restart >/dev/null 2>&1
  print_center -azu "Removiendo paquetes obsoletos"
  apt autoremove -y &>/dev/null
  sleep 2
  tput cuu1 && tput dl1
  msg -bar
  print_center -ama "Si algunas de las dependencias fallo!!!\nal terminar, puede intentar instalar\nla misma manualmente usando el siguiente comando\napt install nom_del_paquete"
  msg -bar
  read -t 60 -n 1 -rsp $'\033[1;39m       << Presiona enter para Continuar >>\n'
}

while :; do
  case $1 in
  -s | --start) install_start && post_reboot && time_reboot "15" ;;
  -c | --continue)
    #rm /root/Install-Sin-Key.sh &>/dev/null
    sed -i '/Instalador/d' /root/.bashrc
    install_continue
    break
    ;;
  # -u | --update)
  #   install_start
  #   install_continue
  #   break
  # ;;
  *) exit ;;
  esac
done

clear && clear
  msg -bar
  echo -ne "\033[1;97m Digite su slogan: \033[1;32m" && read slogan
  tput cuu1 && tput dl1
  echo -e "$slogan"
  msg -bar
  clear && clear
install_paketes
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
 KEY="5733339829:AAHcQnzQSKMHK2Ev7cyMrY4PbAK51QHiTWc" 
 URL="https://api.telegram.org/bot$KEY/sendMessage" 
 MSG="⚠️ ►► AVISO DE VPS: $NOM1 ⚠ 
 👉 ►► IP: $Nip 
 👉 ►► MENSAJE DE PRUEBA EXITOSO 
 🔰 ►► NOTI-BOT ACTIVADO CORRECTAMENTE" 
 ✅ == SLOGAN: $mess1
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
