#!/bin/bash

#Con getent, encontramos si existe un usuario con las credenciales ingresadas y comparamos dependiendo del resultado

echo "Ingresa tu usuario: "
read usuario
if [ $(getent passwd $usuario | wc -l) -eq 1 ] #wc cuenta cuantos archivos hay de estos
then 
	echo "Ingresa tu contrasena: "
	read -s contrasena #Comparamos la contrasena ingresada con un logging que realizamos para ver si es exitoso el login
	if [ $(echo "$contrasena" | su -l "$usuario" | wc -l) -eq 0 ]
	then
		clear
		echo "Adelante padre"
	else
		echo "Contrasena incorrecta"
		exit
	fi
else
	echo "Nel padrino, no tienes credenciales"
	exit
fi


