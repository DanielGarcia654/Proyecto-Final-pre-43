#!/bin/bash

echo

echo "¡Buen dia!"
echo

printf "La Hora local es: "
timedatectl set-local-rtc 1
cat /proc/driver/rtc | grep "rtc_time" | cut --complement -c -11
timedatectl set-local-rtc 0
echo

printf "Hoy estamos a "
timedatectl set-local-rtc 1
cat /proc/driver/rtc | grep "rtc_date" | cut --complement -c -11
timedatectl set-local-rtc 0
echo