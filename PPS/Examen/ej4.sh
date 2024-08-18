#!/bin/bash

if [ "$#" -ne 5 ]; then
    echo "Error: Se requieren exactamente 5 argumentos."
    exit 1
fi


ejecutable=$1
fichero1=$2
directorio=$3
fichero2=$4
fichero3=$5


if [ ! -x "$ejecutable" ]; then
    echo "Error: El primer argumento no es un ejecutable."
    exit 2
fi

if [ ! -r "$fichero1" ]; then
    echo "Error: El segundo argumento no es un fichero existente y legible."
    exit 3
fi

if [ ! -d "$directorio" ]; then
    mkdir "$directorio" 2>/dev/null
    if [ $? -ne 0 ]; then
        echo "Error: No se pudo crear el directorio especificado."
        exit 4
    fi
fi

"$ejecutable" < "$fichero1" > "$directorio/$fichero2" 2> "$directorio/$fichero3"
exit 0
