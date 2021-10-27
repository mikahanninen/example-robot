# Readme

La tarea descargará todos los archivos adjuntos de los correos electrónicos enviados por definido**remitente**(definido en el**vault.yaml**) y analizará la información de dirección específica del archivo PDF.

Para ejecutar esta tarea, el**vault.yaml**El archivo que contiene los secretos necesarios debe crearse en el nivel raíz del robot.

```yaml
email:
  username: EMAIL-USERNAME
  password: EMAIL-PASSWORD
  sender: SENDER-EMAILADDRESS
```

los[NASDAQ_ABCB_2019.pdf](NASDAQ_ABCB_2019.pdf)presenta el PDF de ejemplo desde el que se analiza la información de la dirección.
