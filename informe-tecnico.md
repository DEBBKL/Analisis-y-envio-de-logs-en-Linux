# INFORME TÉCNICO – Análisis y Envío de Logs en Linux

---

## 1. Verificación del archivo `/var/log/boot.log`

Se analizó el archivo de logs de arranque usando el comando:

```bash
tail -f /var/log/boot.log
```

Este archivo registra el proceso de inicio del sistema, incluyendo:

  * Activación de servicios
  * Fallos o errores durante el arranque
  * Duración de cada servicio

Ejemplo de evento detectado:

  ```css
  [  OK  ] Started Network Manager.
  ```

Esto indica que el servicio se inició correctamente.

---

## 2. Inspección del sistema de logs (`syslog` y `journalctl` )

En Kali Linux, al intentar acceder a `/var/log/syslog` con:

  ```bash
  less +F /var/log/syslog
  ```

Se detectó que el archivo no existe, ya que Kali utiliza `systemd` y gestiona los logs mediante `journalctl`.

Comprobación:

  ```bash
  ls /var/log
  ```

**Visualización de logs en tiempo real:**

  ```bash
  sudo journalctl -f
  ```

**Activación del servicio `rsyslog` :**
  ```bash
  sudo systemctl enable rsyslog
  sudo systemctl start rsyslog
  sudo systemctl status rsyslog
  ```

Despues de editar su configuración, se reinicia con:

  ```bash
  sudo systemctl restart rsyslog
  ```

---

## 3. Análisis de eventos registrados.
```
**Ejemplo de evento extraído**
***Tipo de evento**: Acción normal.
***Usuario origen**: system[1]
***Hora del evento**: 12:09
***Servicio involucrado**: `ppsessionclean.service`
***Ubicación**: Servicio de limpieza de sesiones.
***Causa probable**: Finalización correcta de servicio.
```

---

## 4. Transferencia de logs a otro equipo.

### 4.a. Transferencia mediante SCP

* Se comprimió el archivo de logs:
  
  ```bash
  sudo gzip -c /var/log/syslog > syslog.gz
  ```

* Luego, se transfirió al equipo remoto:
  
    ```bash
    scp syslog.gz usuario@10.0.2.5:/home/usuario/
    ```

### 4.b. Transferencia alternativa con Netcat

* En el equipo receptor (Ubuntu):

  ```bash
  nc -l -p 12345 > syslog.gz
  ```

* En el equipo emisor (Kali Linux, IP 10.0.2.7):

  ```bash
  sudo cat syslog.gz | nc 10.0.2.5 12345
  ```

El archivo se recibió correctamente en el directorio donde se ejecutó el comando `nc`.

---

## 5. Reflexión y Conclusiones

**¿Por qué es útil enviar logs a otro equipo?**
- Permite conservar evidencia ante fallos o ataques.
- Mejora la monitorización centralizada.
- Facilita el trabajo forense y la auditoría.

**¿Cómo ayuda en la detección de incidentes?**
- Permite identificar accesos no autorizados o anómalos.
- Ayuda a detectar errores persistentes.
- Aporta datos esenciales a herramientas SIEM para generar alertas en tiempo real.

**Medidas de seguridad al transferir logs**
- Usar protocolos cifrados (SCP o SSH)
- Restringir el acceso solo a usuarios autorizados
- Verificar la integridad del archivo recibido

---

**Nombre y Apellidos**: Deborah Loisel Santana  
**Fecha**: 14/03/2025  
