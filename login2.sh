#!/bin/bash
trap ' ' 2 15 20
#Con getent, encontramos si existe un usuario con las credenciales ingresadas y comparamos dependiendo del resultado
clear
echo "Ingresa tu usuario: "
read usuario
if [ $(getent passwd $usuario | wc -l) -eq 1 ] #wc cuenta cuantos archivos hay de estos, lo podemos usar para comparar la cantidad
then
	echo "Ingresa tu contrasena: "
	contrasena=$(su -c echo "$usuario")
	#usamos un pequeno login y dependiendo del estado(0-exitoso, 1-error) comparamos para continuar el programa, la -c es para que se ejecute un comando (en este caso un echo vacio) junto al usuario
	if [ $? -eq 0 ] #$?: es el estado del comando ejecutado actual (nuestro comando es el su 
	then
		clear
		echo "Adelante padre"
		chmod +x ./terminal.sh
		./terminal.sh #llamamos el script de la terminal si el loging es exitoso
	else
		echo "Contrasena incorrecta"
		exit
	fi
else
	echo "Nel padrino, no tienes credenciales"
	exit
fi


