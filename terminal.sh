#!/bin/bash

chmod +x ./login2.sh
#./login2.sh
clear
inicio=1;
quiensoy=$(whoami)
dir=$(pwd)

#./login2.sh Para llamar otros scripts

carpeta=${dir##*/} #Para imprimir unicamente la carpeta (##*/ para limitar todo lo que esta antes de la barra -/-, como si se imprimiera unicamente el nombre de un archivo)
texto="$quiensoy - $carpeta "
while [ $inicio -eq 1 ]
do
	echo -n "$texto"; read comando #leemos la cadena de texto que ingresara el usuario para interpretarla en la terminal
	if [[ "$comando" == "salir" ]]
	then
		inicio=0; clear
	elif [[ "$comando" == "reproductor" ]]
	then
		chmod +x ./reproductor.sh
		./reproductor.sh
	else
		$comando #Para usar los comandos predeterminados de Linux
	fi
done
