# Análisis y Envío de Logs en Linux

Este repositorio documenta una práctica técnica enfocada en el análisis básico de registros (logs) en sistemas Linux. Se exploran distintas formas de visualizar eventos del sistema, comprimir archivos de log, transferirlos entre máquinas de forma segura y reflexionar sobre su utilidad en contextos de seguridad informática y administración de sistemas.

---

## Contenido del repositorio

logs-linux/
├── README.md
├── informe-tecnico.md
├── capturas/
│ ├── boot-log.png
│ ├── journalctl-f.png
│ ├── rsyslog-status.png
│ ├── netcat-transfer.png
├── logs/
│ └── syslog.gz
├── scripts/
│ ├── activar-rsyslog.sh
│ ├── enviar-log-scp.sh
│ ├── enviar-log-netcat.sh
│ ├── escuchar-netcat.sh
└── .gitignore


---

## 🧩 Objetivos de la práctica

- Analizar el archivo de arranque del sistema (`/var/log/boot.log`).
- Visualizar eventos del sistema usando `journalctl`.
- Configurar y verificar el servicio `rsyslog`.
- Comprender los campos clave de un evento de log.
- Comprimir un log (`gzip`) y transferirlo mediante:
  - SCP (Secure Copy)
  - Netcat (nc)
- Reflexionar sobre la utilidad de la transferencia de logs y su rol en la ciberseguridad.

---

## ⚙️ Requisitos técnicos

- Sistema operativo Linux (probado en Kali Linux y Ubuntu)
- Acceso a terminal con permisos sudo
- Red local o virtual que permita conexión entre equipos
- Herramientas instaladas:
  - `systemd` y `journalctl`
  - `rsyslog`
  - `scp` y `ssh`
  - `netcat` (nc)
  - `gzip`

---

## 🧪 Uso de los scripts

Todos los scripts se encuentran en la carpeta `/scripts` y se deben ejecutar con permisos de ejecución:

```bash
chmod +x scripts/*.sh
```

### 1. Activar y comprobar rsyslog

  ```bash
  ./scripts/activar-rsyslog.sh
  ```

### 2. Comprimir y transferir el log con SCP

  ```bash
  ./scripts/enviar-log-scp.sh
  ```

⚠️ Asegúrate de modificar `DESTINO_USUARIO, DESTINO_IP y DESTINO_RUTA` dentro del script antes de usarlo.

### 3. Enviar log con Netcat

  * En el equipo receptor:
    ```bash
    ./scripts/escuchar-netcat.sh
    ```

  * En el equipo emisor:
    ```bash
    ./scripts/enviar-log-netcat.sh
    ```

---

## Informe técnico

Puedes encontrar el desarrollo completo de la práctica, con explicaciones, comandos utilizados y reflexiones, en el archivo:

📁 `informe-tecnico.md`

Incluye:

  * Descripción paso a paso de cada actividad.
  * Análisis de eventos de logs reales.
  * Capturas de pantalla.
  * Conclusiones sobre el uso de logs en la gestión de seguridad.

---

## Conclusión

Este proyecto demuestra cómo se pueden analizar logs en Linux para identificar eventos relevantes del sistema, y cómo estos registros pueden ser compartidos con otros equipos para su análisis centralizado. El manejo adecuado de los logs es clave en entornos profesionales donde se requieren auditorías, respuestas a incidentes y cumplimiento normativo.

---

## Licencia

Este proyecto puede utilizarse con fines educativos o personales. Si deseas reutilizar el contenido con fines comerciales o formativos, menciona al autor original y proporciona un enlace a este repositorio.
