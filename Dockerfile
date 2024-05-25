FROM ubuntu:jammy

ENTRYPOINT ["/script-mostrar-csv.sh"]

RUN apt update && apt install wget -y

# instalar Powershell Core con un script
WORKDIR /root
COPY ./script-instalacion-pwsh.sh .
RUN chmod u+x script-instalacion-pwsh.sh && \
	sh -c ./script-instalacion-pwsh.sh && \
	rm script-instalacion-pwsh.sh

# instalar el módulo ImportExcel con un script
COPY ./script-instalacion-modulos.sh .
RUN chmod u+x script-instalacion-modulos.sh && \
	sh -c ./script-instalacion-modulos.sh && \
	rm script-instalacion-modulos.sh

# usamos un script de Powershell para convertir todos los archivos XLSX de /XLSX en CSV y 
# dejarlos en la carpeta /CSV, pero no se ejecuta hasta que se inicia un contenedor
WORKDIR /
RUN mkdir /CSV && mkdir /XLSX
COPY script-pwsh.ps1 .

# script que muestra el contenido de los archivos CSV
COPY script-mostrar-csv.sh /
RUN chmod u+x /script-mostrar-csv.sh
