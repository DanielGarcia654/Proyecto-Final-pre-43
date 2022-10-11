#!/bin/bash

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
corte=$(cut -c 3- texto4.txt) #Cortamos las diagonales anteriores y guardamos en una variable
rm texto.txt && rm texto2.txt && rm texto3.txt && rm texto4.txt #Eliminamos todos los txt generados
clear #Borramos el desmadre que aparece
cd "$ruta" #Regresamos a la ruta original
rutafinal=$(ls "$corte"/"$archivo") #Si no se encuentra el archivo, dara un error y se imprime que no se encontro, si si se encuentra, imprimimos la ruta
if [ $? -eq 2 ] #$? obtiene el status actual del comando ejecutado anterorimente (0 exitoso, 1 error basico, 2 error mas complejo)
then
	echo "No se ha encontrado"
else
	echo "Ruta: $rutafinal"
fi
#Creo se puede ir reescribiendo un mismo txt para no ir generando tantos
#pero como fue mas comodo uno por uno e ir viendo que se va guardando
#lo realizamos asi, otra cosa creo que solo funciona en el directorio del usuario
#actual, con los demas se bugea
