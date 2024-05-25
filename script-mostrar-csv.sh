#!/bin/bash

# convertir los archivos XSLX en CSV
pwsh /script-pwsh.ps1 &> /dev/null

# obtener la ruta absoluta de todos los archivos CSV convertidos
FICHEROS=$(find /CSV -type f -name '*.csv')

# mostrar el contenido de todos los archivos CSV
IFS='
'
for FICHERO in $FICHEROS; do
	echo -e "----------------------\n${FICHERO}\n---------------------\n"
	cat $FICHERO
done
