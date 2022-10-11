#!/bin/bash

trap ' ' 2 15 20

echo "ingrese la palabra que se tiene que advinar"
read palabra
clear

declare -i nletras=$(echo -n "$palabra" | wc -c)
declare -i fallo=0
declare -i lcorrecta=0
declare -i erroresd=6

while [[ $lcorrecta -ne $nletras || $fallo -eq 6 ]]
do
    echo "el numero de letras de la palabra: $nletras"
    echo "letras que fueron correctas: $correctas"
    echo "oportunidades de fallar: $erroresd"
    echo "ingresa una letra que crees que sea parte de la palabra"
    read letra

    if grep -q "$letra" <<< "$palabra";
    then
        clear
        echo ¡bien, acertaste una letra!
        echo
        correctas+=$letra,
        lcorrecta+=1

    else
        if [ $fallo -eq 0 ]
        then
            clear
            echo " |=====|"
            echo ups, un error no es malo
        fi

        if [ $fallo -eq 1 ]
        then
            clear
            echo " |=====|"
            echo " |     |"
            echo segundo error, todavia se puede ganar
        fi

        if [ $fallo -eq 2 ]
        then
            clear
            echo " |=====|"
            echo " |     |"
            echo " O     |"
            echo tercer error, si se puede pero con cuidado
        fi

        if [ $fallo -eq 3 ]
        then
            clear
            echo " |=====|"
            echo " |     |"
            echo " O     |"
            echo "/|\    |"
            echo cuarto error, estas mas cerca de la derrota
        fi

        if [ $fallo -eq 4 ]
        then
            clear
            echo " |=====|"
            echo " |     |"
            echo " O     |"
            echo "/|\    |"
            echo " |     |"
            echo quinto error, uno mas y pierdes
        fi

        if [ $fallo -eq 5 ]
        then
            clear
            echo " |=====|"
            echo " |     |"
            echo " O     |"
            echo "/|\    |"
            echo " |     |"
            echo "/ \    |"
            echo ----------Ya perdiste----------
            break
        fi
        fallo+=1
        erroresd=6-fallo
    fi
done

if [[ $lcorrecta -eq $nletras ]]
then
    echo ----------Felicidades, completaste la palabra :D----------
fi
