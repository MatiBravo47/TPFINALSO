#!/bin/bash


# Definición de colores
ROJO='\e[31m'
VERDE='\e[32m'
AMARILLO='\e[33m'
AZUL='\e[34m'
MAGENTA='\e[35m'
CIAN='\e[36m'
RESET='\e[0m'

generarInforme(){
    # Definir el nombre del archivo log
    LOGFILE="sistema_log.txt"

    # Obtener la fecha y hora actual
    echo -e "${AMARILLO}Informe del sistema - $(date)${RESET}" > $LOGFILE
    echo "" >> $LOGFILE

    # Obtener el uso de la CPU
    echo -e "${AMARILLO}Uso de la CPU:" ${RESET}>> $LOGFILE
    top -b -n 1 | grep "Cpu(s)" >> $LOGFILE
    echo "" >> $LOGFILE

    # Obtener el uso de la memoria
    echo -e "${AMARILLO}Uso de la memoria:${RESET}" >> $LOGFILE
    free -h >> $LOGFILE
    echo "" >> $LOGFILE

    # Obtener el uso del disco
    echo -e "${AMARILLO}Uso del disco:${RESET}" >> $LOGFILE
    df -h >> $LOGFILE
    echo "" >> $LOGFILE

    # Fin del informe
    clear
    echo -e "${VERDE}Informe generado y guardado en $LOGFILE ${RESET}"
    cat sistema_log.txt
}

eliminarTemporales(){

# Confirmación antes de eliminar archivos
while true; do
    read -p "¿Estás seguro de que deseas eliminar archivos temporales y caché? (s/n): " confirm
    case $confirm in
    [sS])
        # Eliminar archivos temporales del sistema
        echo "Eliminando archivos temporales del sistema..."
        sudo rm -rf /tmp/*
        sudo rm -rf /var/tmp/*
        echo "Archivos temporales eliminados."

        # Limpiar caché del sistema
        echo -e "${AMARILLO}Limpiando caché del sistema...${RESET}"
        sudo apt-get clean  # Para sistemas basados en Debian/Ubuntu
        sudo apt-get autoremove -y  # Elimina paquetes no necesarios
        echo -e "${VERDE}Caché del sistema limpiada.${RESET}"

        # Limpiar caché de navegadores (ejemplo para Firefox y Chrome)
        echo -e "${AMARILLO}Eliminando caché de navegadores...${RESET}"
        rm -rf ~/.cache/mozilla/firefox/*/cache2/*
        rm -rf ~/.cache/google-chrome/Default/Cache/*
        echo -e "${VERDE}Caché de navegadores eliminada."

        echo -e "Limpieza completada.${RESET}"
        break
        ;;
    [nN])
        echo "Operación cancelada."
        exit 1
        ;;
    *)
        echo "opcion incorrecta, vuelva a ingresar otra opcion"
        ;;
    esac
done
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
cat $LOGFILE   
}

clear
    echo -e "${AMARILLO}Bienvenido!"

#Menu opciones
while true; do
    echo -e "Elija una opcion${RESET}"
    echo "1.Generar un informe con el uso actual de la CPU, memoria y disco, y guardarlo en un archivo log."
    echo "2.Eliminar archivos temporales, caché del sistema y de navegadores para liberar espacio en disco."
    echo "3.Verificar e instalar actualizaciones del sistema de forma automática, registrando los cambios."
    echo -e "${ROJO}4.Salir.${RESET}"
    read opcion

    case $opcion in
        1) generarInforme;;
        2) eliminarTemporales;;
        3) actualizaciones;;
        4) echo "Saliendo..."; sleep 1; clear; exit 0;;
        *) clear; echo -e "${ROJO}Opcion incorrecta!, vuelva a ingresar otra opcion${RESET}";;
    esac
done 
