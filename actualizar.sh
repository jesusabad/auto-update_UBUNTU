#!/bin/bash

# FORMATOS
yellow='\033[1;33m'
nc='\033[0m'

#REPOSITORIOS
printf "${yellow}Actualizando repositorios...${nc}\n"
sudo apt-get -qq update
printf "${yellow}Repositorios actualizados.${nc}\n"

#PAQUETES
printf "${yellow}Actualizando paquetes...${nc}\n"
sudo apt-get -qq upgrade -y
printf "${yellow}Paquetes actualizados.${nc}\n"

#KERNEL
printf "${yellow}Actualizando KERNEL...${nc}\n"
sudo apt-get -qq dist-upgrade -y
printf "${yellow}KERNEL actualizado.${nc}\n"

#LIMPIEZA
printf "${yellow}Limpiando el sistema...${nc}\n"
sudo apt-get -qq autoclean
sudo apt-get -qq autoremove -y
sudo apt-get -qq clean

printf "${yellow}Sistema actualizado y listo.${nc}\n"

exit
