#!/bin/bash
# Activar y verificar el servicio rsyslog

echo "[+] Habilitando y arrancando rsyslog..."
sudo systemctl enable rsyslog
sudo systemctl start rsyslog

echo "[+] Verificando estado de rsyslog:"
sudo systemctl status rsyslog
