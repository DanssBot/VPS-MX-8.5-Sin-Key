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
fun_bar() {
  comando="$1"
  _=$(
    $comando >/dev/null 2>&1
  ) &
  >/dev/null
  pid=$!
  while [[ -d /proc/$pid ]]; do
    echo -ne " \033[1;33m["
    for ((i = 0; i < 20; i++)); do
      echo -ne "\033[1;31m##"
      sleep 0.5
    done
    echo -ne "\033[1;33m]"
    sleep 1s
    echo
    tput cuu1
    tput dl1
  done
  echo -e " \033[1;33m[\033[1;31m########################################\033[1;33m] - \033[1;32m100%\033[0m"
  sleep 1s
}
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
  mkdir /etc/ADMRufu >/dev/null 2>&1
  cd /etc
  wget https://raw.githubusercontent.com/heshan3031/Multi-Script/main/R9/ADMRufu.tar.xz >/dev/null 2>&1
  tar -xf ADMRufu.tar.xz >/dev/null 2>&1
  chmod +x ADMRufu.tar.xz >/dev/null 2>&1
  rm -rf ADMRufu.tar.xz
  cd
  chmod -R 755 /etc/ADMRufu
  ADMRufu="/etc/ADMRufu" && [[ ! -d ${ADMRufu} ]] && mkdir ${ADMRufu}
  ADM_inst="${ADMRufu}/install" && [[ ! -d ${ADM_inst} ]] && mkdir ${ADM_inst}
  SCPinstal="$HOME/install"
  rm -rf /usr/bin/menu
  rm -rf /usr/bin/adm
  rm -rf /usr/bin/ADMRufu
  echo "$slogan" >/etc/ADMRufu/tmp/message.txt
  echo "${ADMRufu}/menu" >/usr/bin/menu && chmod +x /usr/bin/menu
  echo "${ADMRufu}/menu" >/usr/bin/adm && chmod +x /usr/bin/adm
  echo "${ADMRufu}/menu" >/usr/bin/ADMRufu && chmod +x /usr/bin/ADMRufu
  [[ -z $(echo $PATH | grep "/usr/games") ]] && echo 'if [[ $(echo $PATH|grep "/usr/games") = "" ]]; then PATH=$PATH:/usr/games; fi' >>/etc/bash.bashrc
  echo '[[ $UID = 0 ]] && screen -dmS up /etc/ADMRufu/chekup.sh' >>/etc/bash.bashrc
  echo 'v=$(cat /etc/ADMRufu/vercion)' >>/etc/bash.bashrc
  echo '[[ -e /etc/ADMRufu/new_vercion ]] && up=$(cat /etc/ADMRufu/new_vercion) || up=$v' >>/etc/bash.bashrc
  echo -e "[[ \$(date '+%s' -d \$up) -gt \$(date '+%s' -d \$(cat /etc/ADMRufu/vercion)) ]] && v2=\"Nueva Vercion disponible: \$v >>> \$up\" || v2=\"Script Vercion: \$v\"" >>/etc/bash.bashrc
  echo '[[ -e "/etc/ADMRufu/tmp/message.txt" ]] && mess1="$(less /etc/ADMRufu/tmp/message.txt)"' >>/etc/bash.bashrc
  echo '[[ -z "$mess1" ]] && mess1="@Rufu99"' >>/etc/bash.bashrc
  echo 'clear && echo -e "\n$(figlet -f big.flf "  DANSMX")\n        RESELLER : $mess1 \n\n   Para iniciar DANSMX escriba:  menu \n\n   $v2\n\n"|lolcat' >>/etc/bash.bashrc

  update-locale LANG=en_US.UTF-8 LANGUAGE=en
  clear && clear
  msg -bar
  echo -e "\e[1;92m             >> INSTALACION COMPLETADA <<" && msg bar2
  echo -e "      COMANDO PRINCIPAL PARA ENTRAR AL PANEL "
  echo -e "                      \033[1;41m  menu  \033[0;37m" && msg -bar2
