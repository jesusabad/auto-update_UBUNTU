#!/bin/bash
# Versión 2.1
# VARIABLES Y FORMATOS
var_correcto=''
var_error='Error. Inténtalo más tarde.'
col_yellow='\033[1;33m'
col_red='\033[31m'
nc='\033[0m'

# FUNCIONES
fun_checkLastCommand (){
    if [ $? -eq 0 ]; then
        printf "${col_yellow}$var_correcto${nc}\n"
    else
        printf "${col_red}\n$var_error\n" && exit 1
    fi
}

# COMPRUEBA LA INSTALACIÓN DEL SCRIPT
if [ ! -e "/usr/local/bin/actualizar" ]; then
    printf "${col_yellow}No existe el enlace simbólico, así que lo creo.${nc}\n"
    var_error='Error creando el enlace simbólico. "¿Has usado sudo?"'
    sudo ln -s "$PWD/actualizar.sh" /usr/local/bin/actualizar
    fun_checkLastCommand
fi

# REPARACIONES (antes de actualizar)
printf "${col_yellow}COMPROBANDO PAQUETES ROTOS...${nc}\n"
sudo dpkg --configure -a && sudo apt install -f -y
var_correcto="Reparación de paquetes completada."
fun_checkLastCommand

# REPOSITORIOS
printf "${col_yellow}\nACTUALIZANDO REPOSITORIOS...${nc}\n"
sudo apt update
var_correcto="Repositorios actualizados."
fun_checkLastCommand

# PAQUETES
printf "${col_yellow}\nACTUALIZANDO PAQUETES...${nc}\n"
sudo apt full-upgrade -y
var_correcto="Paquetes del sistema actualizados."
fun_checkLastCommand

# FLATPAK (si está instalado)
if command -v flatpak &> /dev/null; then
    printf "${col_yellow}\nACTUALIZANDO FLATPAK...${nc}\n"
    sudo flatpak update -y
    var_correcto="Flatpak actualizado."
    fun_checkLastCommand
fi

# SNAP (si está instalado)
if command -v snap &> /dev/null; then
    printf "${col_yellow}\nACTUALIZANDO SNAP...${nc}\n"
    sudo snap refresh
    var_correcto="Snap actualizado."
    fun_checkLastCommand
fi

# LIMPIEZA
printf "${col_yellow}\nLIMPIANDO EL SISTEMA...${nc}\n"
sudo apt autoclean -y && sudo apt autoremove -y && sudo apt clean -y
var_correcto="Limpieza de paquetes APT completada."
fun_checkLastCommand

if command -v flatpak &> /dev/null; then
    flatpak uninstall --unused -y
    var_correcto="Limpieza de paquetes Flatpak completada."
    fun_checkLastCommand
fi

printf "${col_yellow}\nSistema actualizado y limpio.${nc}\n"
exit 0
