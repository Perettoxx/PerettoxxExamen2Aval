#!/bin/bash

## Conseguimos las líneas con consumo máximo y mínimo
linea_maximo=$(tail -n +2 consumos.txt | sort -k4nr | head -n 1)
linea_minimo=$(tail -n +2 consumos.txt | sort -k4n | head -n 1)

## Asignamos variables a cada dato correspondiente
## Máximos
ciudad_maximo=$(echo "$linea_maximo" | awk '{print $1}')
mes_maximo=$(echo "$linea_maximo" | awk '{print $2}')
anyo_maximo=$(echo "$linea_maximo" | awk '{print $3}')
consumo_maximo=$(echo "$linea_maximo" | awk '{print $4}')
## Mínimos
ciudad_minimo=$(echo "$linea_minimo" | awk '{print $1}')
mes_minimo=$(echo "$linea_minimo" | awk '{print $2}')
anyo_minimo=$(echo "$linea_minimo" | awk '{print $3}')
consumo_minimo=$(echo "$linea_minimo" | awk '{print $4}')

# Mostramos los resultados
echo "$ciudad_maximo en $mes_maximo $anyo_maximo con $consumo_maximo ha sido la ciudad con mayor consumo."
echo "$ciudad_minimo en $mes_minimo $anyo_minimo con $consumo_minimo ha sido la ciudad con menor consumo."
