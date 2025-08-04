#!/bin/bash
# Comprimir syslog y enviarlo a otro equipo usando SCP

DESTINO_USUARIO="usuario"
DESTINO_IP="10.0.2.5"
DESTINO_RUTA="/home/usuario"
LOG_ORIGEN="/var/log/syslog"
ARCHIVO_COMP="syslog.gz"

echo "[+] Comprimiendo log..."
sudo gzip -c $LOG_ORIGEN > $ARCHIVO_COMP

echo "[+] Enviando $ARCHIVO_COMP a $DESTINO_USUARIO@$DESTINO_IP:$DESTINO_RUTA ..."
scp $ARCHIVO_COMP $DESTINO_USUARIO@$DESTINO_IP:$DESTINO_RUTA
