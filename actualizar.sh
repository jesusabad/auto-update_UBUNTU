#!/bin/sh

# VARIABLES Y FORMATOS
var_correcto=''
yellow='\033[1;33m'
red='\033[31m'
nc='\033[0m'

# MENSAJE DE SALIDA
mensaje (){
	if [ $? -eq 0 ]; then 
		printf "${yellow}$var_correcto${nc}\n\n";
		else printf "${red}\nError. Inténtalo más tarde.\n\n" && exit;
	fi
}

#REPOSITORIOS
printf "${yellow}Actualizando repositorios...${nc}\n"
var_correcto="Repositorios actualizados."
sudo apt update
mensaje

#PAQUETES
printf "${yellow}Actualizando paquetes...${nc}\n"
var_correcto="Paquetes actualizados."
sudo apt upgrade -y
mensaje

#KERNEL
printf "${yellow}Comprobando actualización del kernel...${nc}\n"
var_correcto="Actualización del kernel comprobada."
sudo apt full-upgrade -y
mensaje

#REPARACIONES
printf "${yellow}Comprobando paquetes rotos${nc}\n"
var_correcto="Paquetes rotos comprobados."
sudo apt install -f -y &&
sudo dpkg --configure -a
mensaje

#LIMPIEZA
printf "${yellow}Limpiando el sistema...${nc}\n"
var_correcto="Limpieza terminada\n\nSistema actualizado y limpio"
sudo apt autoclean &&
sudo apt autoremove -y &&
sudo apt clean
mensaje

exit
