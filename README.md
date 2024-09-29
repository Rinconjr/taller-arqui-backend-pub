
# .NET Publicador (HTTP a RabbitMQ)

Este proyecto es un servicio backend creado en .NET que expone un endpoint HTTP para recibir mensajes y luego publicarlos en uno o varios tópicos de RabbitMQ.

## Requisitos

- .NET SDK 6.0 o superior
- RabbitMQ en funcionamiento
- Una configuración correcta del archivo `appsettings.json` para RabbitMQ

## Nota Importante

Este es el primer proyecto que se debe compilar y ejecutar en la infraestructura. Asegúrate de configurarlo correctamente antes de proceder con otros servicios que dependan de este publicador.

## Comandos

### Ejecutar la aplicación con Docker Compose

Para ejecutar la aplicación, utiliza el siguiente comando:

```bash
docker-compose up
```

Este comando levantará los servicios necesarios definidos en el archivo `docker-compose.yml` para ejecutar la aplicación.
