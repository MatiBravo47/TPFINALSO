#!/bin/bash
#Menu opciones

echo "Elija una opcion"
echo "1.Generar un informe con el uso actual de la CPU, memoria y disco, y guardarlo en un archivo log."
echo "2.Eliminar archivos temporales, caché del sistema y de navegadores para liberar espacio en disco."
echo "3.Verificar e instalar actualizaciones del sistema de forma automática, registrando
los cambios."
read opcion

generarInforme(){
    # Definir el nombre del archivo log
    LOGFILE="sistema_log.txt"

    # Obtener la fecha y hora actual
    echo "Informe del sistema - $(date)" > $LOGFILE
    echo "==============================" >> $LOGFILE

    # Obtener el uso de la CPU
    echo "Uso de la CPU:" >> $LOGFILE
    top -b -n 1 | grep "Cpu(s)" >> $LOGFILE
    echo "" >> $LOGFILE

    # Obtener el uso de la memoria
    echo "Uso de la memoria:" >> $LOGFILE
    free -h >> $LOGFILE
    echo "" >> $LOGFILE

    # Obtener el uso del disco
    echo "Uso del disco:" >> $LOGFILE
    df -h >> $LOGFILE
    echo "" >> $LOGFILE

    # Fin del informe
    echo "Informe generado y guardado en $LOGFILE"
}

eliminarTemporales(){

# Confirmación antes de eliminar archivos
read -p "¿Estás seguro de que deseas eliminar archivos temporales y caché? (s/n): " confirm
if [[ $confirm != "s" ]]; then
    echo "Operación cancelada."
    exit 1
fi

# Eliminar archivos temporales del sistema
echo "Eliminando archivos temporales del sistema..."
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*
echo "Archivos temporales eliminados."

# Limpiar caché del sistema
echo "Limpiando caché del sistema..."
sudo apt-get clean  # Para sistemas basados en Debian/Ubuntu
sudo apt-get autoremove -y  # Elimina paquetes no necesarios
echo "Caché del sistema limpiada."

# Limpiar caché de navegadores (ejemplo para Firefox y Chrome)
echo "Eliminando caché de navegadores..."
rm -rf ~/.cache/mozilla/firefox/*/cache2/*
rm -rf ~/.cache/google-chrome/Default/Cache/*
echo "Caché de navegadores eliminada."

echo "Limpieza completada."
}

actualizaciones(){

# Configuración de variables
LOGFILE="/var/log/actualizaciones.log"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

# Función para registrar en el log
function log {
    echo "$DATE - $1" >> $LOGFILE
}

# Verificar actualizaciones
echo "Verificando actualizaciones..."
if sudo apt-get update > /dev/null 2>&1; then
    log "Actualizaciones verificadas con éxito."
else
    log "Error al verificar actualizaciones."
    exit 1
fi

# Instalar actualizaciones
echo "Instalando actualizaciones..."
if sudo apt-get upgrade -y > /dev/null 2>&1; then
    log "Actualizaciones instaladas con éxito."
else
    log "Error al instalar actualizaciones."
    exit 1
fi

# Limpiar el caché
echo "Limpiando caché de paquetes..."
if sudo apt-get clean > /dev/null 2>&1; then
    log "Caché de paquetes limpiada con éxito."
else
    log "Error al limpiar el caché de paquetes."
    exit 1
fi

# Finalizar
echo "Proceso de actualización completado."
}




case $opcion in
    1) generarInforme;;
    2) eliminarTemporales;;
    3) actualizaciones;;
    *) echo "Opcion incorrecta";;
esac

