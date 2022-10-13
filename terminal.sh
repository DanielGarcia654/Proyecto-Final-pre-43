#!/bin/bash

trap ' ' 2 15 20 #Para evitar que el usuario salga de programa con CTRL+Z o CTRL+C
clear
inicio=1
quiensoy=$(whoami)
dir=$(pwd)
dir2=$(pwd)
#./login2.sh Para llamar otros scripts

carpeta=${dir##*/} #Para imprimir unicamente la carpeta (##*/ para limitar todo lo que esta antes de la barra -/-, como si se imprimiera unicamente el nombre de un archivo)

while [ $inicio -eq 1 ]
do
	dir=$(pwd) #Llamamos estas dos variables de nuevo para actualizar dinamicamente la carpeta
	carpeta=${dir##*/} #Actualiza la carpeta actual
	echo -n "$(tput bold setaf 5)$quiensoy - $(tput bold setaf 6)$carpeta$(tput sgr0): "; read comando #leemos la cadena de texto que ingresara el usuario para interpretarla en la terminal

	if [[ "$comando" == "salir" ]]
	then
		inicio=0; clear
	elif [[ "$comando" == "reproductor" ]]
	then
		cd "$dir2" #Es para acceder a la ubicacion donde se encuentra el proyecto y ejecutar los scripts
		chmod +x reproductor.sh
		./reproductor.sh
		cd "$dir" #regresamos a la ubicacion donde se encontraba el usuario
	elif [[ "$comando" == "buscar" ]]
	then
		cd "$dir2"
		chmod +x buscar.sh
		./buscar.sh
		cd "$dir"
	elif [[ "$comando" == "fecha" ]]
	then
		cd "$dir2"
		chmod +x fechaHora.sh
		./fechaHora.sh
		cd "$dir"
	elif [[ "$comando" == "infosis" ]]
	then
		cd "$dir2"
		chmod +x info.sh
		./info.sh
		cd "$dir"
	elif [[ "$comando" == "juego" ]]
	then
		cd "$dir2"
		chmod +x ahorcado.sh
		./ahorcado.sh
		cd "$dir"
	elif [[ "$comando" == "creditos" ]]
	then
		cd "$dir2"
		chmod +x creditos.sh
		./creditos.sh
		cd "$dir"
	elif [[ "$comando" == "ayuda" ]]
	then
		echo "Estos son los comandos disponibles: "
		echo "    infosis - despliega la informacion del sistema"
		echo "    fecha - despliega la fecha y hora actual"
		echo "    buscar - busca un archivo en un directorio especifico (parametros: carpeta y archivo a buscar"
		echo "    juego - despliega un juego (ahorcado)"
		echo "    reproductor - abre el reproducto de musica"
		echo "    creditos - creditos de los creadores"
		echo "    salir - para salir de la terminal"
	else
		$comando #Para usar los comandos predeterminados de Linux
	fi
done
