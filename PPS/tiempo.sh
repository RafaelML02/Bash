#!/bin/bash

if [$# -eq 1]; then
    if ["$1" = "-h"]; then
        echo "Uso: $0 [ -h | LUGAR ]" 
        echo "  Crea un fichero con el nombre del lugar y la fecha actual conteniendo"
        echo "  la predicción del tiempo según el servicio https://wttr.in"
    else 
    	LUGAR=$1 
        FECHA=$(date +%Y-%m-%d)
        NOMBREFICHERO=$LUGAR-$FECHA.txt
        if [-e $NOMBREFICHERO]; then
        	echo "Ya existe el fichero $NOMBREFICHERO"
        else
        	curl --silent https://wttr.in/$1?T > $1-$FECHA.txt
            fi
    fi

else
    echo "USO: $0 [ -h | LUGAR ]" 1>&2
    echo "  Crea un fichero con el nombre del lugar y la fecha actual conteniendo" 1>&2
    echo "  la predicción del tiempo según el servicio https://wttr.in" 1>&2
    exit 1
fi

exit 0