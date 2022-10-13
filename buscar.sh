#!/bin/bash
trap ' ' 2 15 20
ruta=$(pwd) #Para conservar la carpeta de origen
echo "Ingresa la carpeta: "
read carpeta
echo "Ingresa el archivo: "
read archivo #Solicitamos el archivo y carpeta a buscar
cd ~ #Nos vamos al directorio principal del usuario
grep -r "$carpeta">texto.txt #La informacion que contiene el directorio carpeta, la buscamos con el comando grep y la guardamos en un txt
grep "file:" texto.txt>texto2.txt #Dentro de la informacion obtenida, la ruta de la carpeta a buscar se encuentra en un fragmento que contiene la palabra *file: *, por lo tanto, vuelvo a buscar dicha palabra en el txt y lo vuelvo a guardar en otro txt"
cut -d ":" -f 3 texto2.txt>texto3.txt #Ahora tenemos la ruta pero con palabras de mas, usamos cut para cortar los caracteres inesecarios (asi como la palabra file) y guardamos de nuevo en otro txt
grep "//" texto3.txt > texto4.txt #Finalmente, quitamos cadenas que se hayan colado de mas (solo la ruta contiene tres diagonales ///) y la mandamos a un nuevo txt
texto=$(cat texto4.txt | cut -c 3-) #En el ultimo archivo generado, donde ya agarramos las rutas de los greps anteriores
clear
grep "added" texto4.txt #Si se encuentra una palabra extrana (added) debemos quitarla para imprimir la ruta
if [[ $? -eq 0 ]] #Si el comando anterior es exitoso (0 si si es) se ejecuta lo siguiente
then
	sed -i '/added/d' texto4.txt >> texto4.txt #Con sed eliminamos todas las cadenas que contengan la palabra added (no sirve si la tiene)
	texto=$(cat texto4.txt | cut -c 3-) #Abrimos el archivo, lo guardamos en una variable y recortamos las primeras diagonales
	clear
	texto2=$(ls "$texto"/"$archivo") #Buscamos si existe la ruta junto al archivo ingresado
	if [ $? -eq 2 ] #2 si es un error que no encuentra la ruta
	then
		echo "No se ha encontrado"
	else
		echo "Ruta: $texto2"
	fi
else
#Este else por si no se encuentra la palabra added, haremos lo mismo que las estructuras anteriores
	texto2=$(ls "$texto"/"$archivo")
	if [ $? -eq 2 ] #$? obtiene el status actual del comando ejecutado anterorimente (0 exitoso, 1 error basico, 2 error mas complejo)
	then
		echo "No se ha encontrado"
	else
		echo "Ruta: $texto2"
	fi
	#Creo se puede ir reescribiendo un mismo txt para no ir generando tantos
	#pero como fue mas comodo uno por uno e ir viendo que se va guardando
	#lo realizamos asi, otra cosa creo que solo funciona en el directorio del usuario
	#actual, con los demas se bugea
fi
rm texto.txt && rm texto2.txt && rm texto3.txt && rm texto4.txt #Eliminamos todos los txt generados
cd "$ruta"
#Finalmente regresamos a la ruta original y eliminamos los archivos creados
