# actualizar.sh / actualiza.sh

###### Script de actualización desatendida para sistemas Linux en base Debian.

Son dos scripts muy parecidos que actualizan el sistema, reparan errores comunes y limpian actualizaciones antiguas. Sólo se necesita uno de ellos pero se pueden tener ambos.

El primero de ellos es _actualizar.sh_ (con R) que sería el que realmente necesito y uso, que te pide la contraseña cuando lo lanzas y anteriormente se accedía mediante alias.

El otro es _actualiza.sh_ (sin R) que sería el más profesional, que se mete en `</usr/bin>` y se llama desde cualquier usuario y sobre todo necesita ser llamado con permisos de administrador.

## Instalación

Su instalación es muy sencilla, se descarga cualquiera de ellos y preferiblemente se situa en tu carpeta de scripts ($HOME/scripts) aunque puede ser en cualquier otra carpeta. Y desde ahí lo ejecutas con permisos de administrador:

```bash
sudo ./actualizar.sh
```

O en el caso de que uses el segundo script:

```bash
sudo ./actualiza.sh
```

Si es la primera vez que se ejecuta, creará un enlace simbólico en `</usr/bin>` y a partir de ese momento lo podrás ejecutar en cualquier momento como un comando:

```bash
actualizar
```

O en el caso de que uses el segundo script:

```bash
actualiza
```

## Errores conocidos

Al hacer el enlace con el script, se realiza con el comando `<ln -s>` en lugar de `<ln -f>` porque en el ordenador del desarrollador principal con el enlace fuerte daba error (sin una explicación clara).

## About actualizar.sh / actualiza.sh

Versión 1.0
Creador ITAdicts
Fecha 23-07-2015
Web https://itadicts.com
Mail itadicts@outlook.com

Versiones 1.1 y 2.0
Creador Jesús Abad
Fecha 18-05-2020
Web https://que-cosas.blogspot.com
Con la ayuda del grupo de Telegram **Shell_Cli_Bash_Scripting** (https://t.me/shell_cli_bash_scripting)
