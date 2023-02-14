#!/bin/bash

while true; do
    ## Borramos el terminal
    clear
    ## Nos quedamos con las líneas que empiezen por el nombre del parámetro que hemos dado
    if grep -q "^$1 " consumos.txt; then
        ## Realizamos un contador de consumos con awk
        consumototal=$(awk -v ciudad=$1 '$1 == ciudad {consumo += $4} END {print consumo}' consumos.txt)
        echo "$consumototal es el consumo total para $1"
        ## Salimos del bucle
        break
    else
        ## Enviamos un mensaje en caso de que no se haya introducido ninguna ciudad como parámetro o si no se ha introducido alguna válida
        echo "No has introducido ninguna ciudad o no la has introducido correctamente."
        read -p "Introduce la ciudad de nuevo: " ciudad
        set -- "$ciudad" ## Este comando convierte $ciudad en el parámetro $1
    fi
done