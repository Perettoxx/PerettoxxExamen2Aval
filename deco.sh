#!/bin/bash

while true; do
    ## Borramos el terminal
    clear
    ## Nos quedamos con las líneas que empiezen por el nombre del parámetro que hemos dado
    if grep -q "^$1 " consumos.txt; then
        ## Asignamos a una variable el resultado de cmedia.sh
        consumomedio=$(./cmedia.sh "$1")
        ## Se aplica un if para saber si es ECO o no
        if (( $(echo "$consumomedio < 400" |bc -l) )); then
            echo "$1 es ECO"
        else
            echo "$1 no es ECO"
        fi
        break
    else
        ## Enviamos un mensaje en caso de que no se haya introducido ninguna ciudad como parámetro o si no se ha introducido alguna válida
        echo "No has introducido ninguna ciudad o no la has introducido correctamente."
        read -p "Introduce la ciudad de nuevo: " ciudad
        set -- "$ciudad" ## Este comando convierte $ciudad en el parámetro $1
    fi
done