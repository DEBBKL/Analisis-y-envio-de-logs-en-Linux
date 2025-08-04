#!/bin/bash
# Esperar archivo entrante por Netcat

PUERTO=12345
ARCHIVO_DEST="syslog.gz"

echo "[+] Esperando conexión en puerto $PUERTO..."
nc -l -p $PUERTO > $ARCHIVO_DEST

echo "[+] Archivo recibido como $ARCHIVO_DEST"
