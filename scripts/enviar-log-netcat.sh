#!/bin/bash
# Enviar syslog.gz a través de Netcat

DESTINO_IP="10.0.2.5"
PUERTO=12345
ARCHIVO_COMP="syslog.gz"

echo "[+] Enviando $ARCHIVO_COMP a $DESTINO_IP:$PUERTO usando Netcat..."
cat $ARCHIVO_COMP | nc $DESTINO_IP $PUERTO
