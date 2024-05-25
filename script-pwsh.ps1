# convertir el archivo con formato XLSX a CSV, y almacenarlo en el archivo /fichero.csv

foreach ($FICHERO in (Get-ChildItem -Path '/XLSX/*.xlsx')) {
	Import-Excel -Path $FICHERO.fullname -Worksheet "Hoja1" -WarningAction SilentlyContinue |
		ConvertTo-Csv | Out-File "/CSV/$($FICHERO.basename).csv"
}
