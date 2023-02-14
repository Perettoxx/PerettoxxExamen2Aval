#!/bin/bash

## Primero cogemos los nombres de las ciudades 
tail -n+2 consumos.txt | awk '{print $1}' | sort | uniq > ciudades.txt
## Contamos el número de ciudades a iterar
ciudades=`cat ciudades.txt | wc -l`

## Iteramos
for i in `seq  $ciudades`
do
    ## Ejecutamos para cada ciudad
    ciudad=`tail -n+$i ciudades.txt | head -n1`
    ./cmedia.sh $ciudad
done