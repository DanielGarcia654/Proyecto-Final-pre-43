#!/bin/bash

echo
printf "> RAM Total:                        "
cat /proc/meminfo | grep "MemTotal" | cut --complement -c -17
echo

printf "> RAM Usada:                        "
cat /proc/meminfo | grep "MemAvailable" | cut --complement -c -17
echo

printf "> ID Fabricante:                    "
cat /proc/cpuinfo | grep "vendor" | cut --complement -c -12
echo

printf "> Procesador:                      "
cat /proc/cpuinfo | grep "name" | cut --complement -c -12
echo

printf "> Arquitectura del procesador:      " 
cat /etc/apt/sources.list | grep "Linux" | cut -d ' ' -f8
echo

printf "> Version del sistema operativo:    " 
cat /etc/issue.net
echo
echo
