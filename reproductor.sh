#!/bin/bash

r1=/usr/share/doc/mpg123
r2=/lib/x86_64-linux-gnu/mpg123

if [[ -d "$r1" && -d "$r2" ]]
then
    echo ¿En que idioma tiene su SO? / What language do you have your SO in?
    printf "español=1      english=2: " 
    read idioma
    clear

    if [ $idioma -eq 1 ]
    then
    
        printf "Numero de canciones encontradas: "
        ncanciones= cd && cd Música && ls | wc -l
        
        
        ruta= cd /home/$USER/Música/
        
        declare -i contador=0
        
        echo "Lista de canciones: "
        for canciones in $ruta*
        do
            arreglo+=( "${canciones}" )
            echo $contador.- $canciones
            contador+=1
        done
        echo $contador.- Reproducir todas
                
        echo
        echo ¿Qué cancion deseas escuchar?
        read cancion
        echo
        case $cancion in
            0)
                cd /home/$USER/Música && mpg123 "/home/$USER/Música/${arreglo[$cancion]}"
                echo
                echo Cancion reproducida: ${arreglo[$cancion]}
                echo
                ;;
            1)
                cd /home/$USER/Música && mpg123 "/home/$USER/Música/${arreglo[$cancion]}"
                echo
                echo Cancion reproducida: ${arreglo[$cancion]}
                echo
                ;;
            2)
                cd /home/$USER/Música && mpg123 "/home/$USER/Música/${arreglo[$cancion]}"
                echo
                echo Cancion reproducida: ${arreglo[$cancion]}
                echo
                ;;
            3) 
                cd /home/$USER/Música && mpg123 *
                echo
                echo Reproduciendo todas las canciones
                echo
                ;;
        esac

    elif [ $idioma -eq 2 ]
    then
        printf "Number of songs: "
        ncanciones= cd && cd Music && ls | wc -l
        
        
        ruta= cd /home/$USER/Music/
        
        declare -i contador=0
        
        echo "List of songs: "
        for canciones in $ruta*
        do
            arreglo+=( "${canciones}" )
            echo $contador.- $canciones
            contador+=1
        done
        echo $contador.- Played all
                
        echo
        echo "What song do you want to hear?"
        read cancion
        echo
        case $cancion in
            0)
                cd /home/$USER/Music && mpg123 "/home/$USER/Music/${arreglo[$cancion]}"
                echo
                echo Song played: ${arreglo[$cancion]}
                echo
                ;;
            1)
                cd /home/$USER/Music && mpg123 "/home/$USER/Music/${arreglo[$cancion]}"
                echo
                echo Song played: ${arreglo[$cancion]}
                echo
                ;;
            2)
                cd /home/$USER/Music && mpg123 "/home/$USER/Music/${arreglo[$cancion]}"
                echo
                echo Song played: ${arreglo[$cancion]}
                echo
                ;;
            3) 
                cd /home/$USER/Music && mpg123 *
                echo
                echo Playing all the songs
                echo
                ;;
        esac

    else
        echo opcion invalida / invalid option
    fi

else
    echo El reproductor no se puede ocupar debido a que no esta instalado
    echo ¿Desea instalarlo? 1=si, 2=no
    read instalar
    if [ $instalar -eq 1 ]
    then
        sudo apt-get install mpg123
    elif [ $instalar -eq 2 ]
    then
        echo adios:D
    else
        echo Te lo instalo por meter un numero que no estaba en las opciones
        sudo apt-get install mpg123
    fi
fi
