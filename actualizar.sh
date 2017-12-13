#!/bin/sh

# FORMATOS
yellow='\033[1;33m'
nc='\033[0m'

#REPOSITORIOS
printf "${yellow}Actualizando repositorios...${nc}\n"
sudo apt update
printf "${yellow}Repositorios actualizados.${nc}\n\n"

#PAQUETES
printf "${yellow}Actualizando paquetes...${nc}\n"
sudo apt upgrade -y
printf "${yellow}Paquetes actualizados.${nc}\n\n"

#KERNEL
printf "${yellow}Actualizando KERNEL...${nc}\n"
sudo apt full-upgrade -y
printf "${yellow}KERNEL actualizado.${nc}\n\n"

#REPARACIONES
printf "${yellow}Busqueda y reparación de paquetes rotos${nc}\n"
sudo apt install -f -y
sudo dpkg --configure -a
printf "${yellow}Reparaciones terminadas${nc}\n\n"

#LIMPIEZA
printf "${yellow}Limpiando el sistema...${nc}\n"
sudo apt autoclean
sudo apt autoremove -y
sudo apt clean
printf "${yellow}Limpieza terminada.${nc}\n\n"

printf "${yellow}Sistema actualizado y listo.${nc}\n"

exit
