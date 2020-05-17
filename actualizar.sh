#!/bin/sh

# FORMATOS
yellow='\033[1;33m'
red='\033[31m'
nc='\033[0m'

#REPOSITORIOS
printf "${yellow}Actualizando repositorios...${nc}\n"
sudo apt update
if [ $? = 0 ]; then
	printf "${yellow}Repositorios actualizados.${nc}\n\n";
	else printf "${red}Error${nc}\n" &&	exit;
fi

#PAQUETES
printf "${yellow}Actualizando paquetes...${nc}\n"
sudo apt upgrade -y
if [ $? = 0 ]; then
	printf "${yellow}Paquetes actualizados.${nc}\n\n";
	else printf "${red}Error${nc}\n" &&	exit;
fi

#KERNEL
printf "${yellow}Comprobando grandes actualizaciones${nc}\n"
sudo apt full-upgrade -y
if [ $? = 0 ]; then
	printf "${yellow}Grandes actualizaciones comprobadas${nc}\n\n";
	else printf "${red}Error${nc}\n" &&	exit;
fi

#REPARACIONES
printf "${yellow}Comprobando paquetes rotos${nc}\n"
sudo apt install -f -y
sudo dpkg --configure -a
if [ $? = 0 ]; then
	printf "${yellow}Paquetes rotos comprobados${nc}\n\n";
	else printf "${red}Error${nc}\n" &&	exit;
fi

#LIMPIEZA
printf "${yellow}Limpiando el sistema...${nc}\n"
sudo apt autoclean
sudo apt autoremove -y
sudo apt clean
if [ $? = 0 ]; then
	printf "${yellow}Limpieza terminada${nc}\n\n" && exit;
	else printf "${red}Error${nc}\n" &&	exit;
fi
