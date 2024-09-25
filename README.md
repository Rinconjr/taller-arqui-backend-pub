
# .NET Publicador (HTTP a RabbitMQ)

Este proyecto es un servicio backend creado en .NET que expone un endpoint HTTP para recibir mensajes y luego publicarlos en uno o varios tópicos de RabbitMQ. 

## Requisitos

- .NET SDK 6.0 o superior
- RabbitMQ en funcionamiento
- Una configuración correcta del archivo `appsettings.json` para RabbitMQ

## Estructura del Proyecto

- **CommunWork**: Contiene las clases compartidas y de mensajes.
- **PublicadorAplicacion**: Contiene los controladores y la lógica principal para publicar mensajes en RabbitMQ.

## Configuración del Proyecto

1. Clona el repositorio:
    ```bash
    git clone <URL-del-repositorio>
    cd nombre-del-repositorio
    ```

2. Asegúrate de que RabbitMQ esté corriendo en tu entorno. Puedes instalarlo localmente o usar un servicio de RabbitMQ en la nube.

3. Configura los detalles de conexión en el archivo `appsettings.json`:
    ```json
    {
      "RabbitMQ": {
        "Host": "localhost",
        "Port": 5672,
        "Username": "guest",
        "Password": "guest"
      }
    }
    ```
    Actualiza estos valores según la configuración de tu instancia de RabbitMQ.

## Comandos

### Restaurar dependencias

```bash
dotnet restore
```

Este comando restaurará todas las dependencias definidas en los archivos `.csproj`.

### Compilar la aplicación

```bash
dotnet build
```

Compila el proyecto y genera los archivos binarios necesarios.

### Ejecutar la aplicación en desarrollo

```bash
dotnet run --project PublicadorAplicacion
```

Este comando ejecuta la aplicación desde la carpeta `PublicadorAplicacion`. Puedes interactuar con el endpoint HTTP y enviar mensajes que se publicarán en RabbitMQ.

### Ejecutar pruebas

Si tienes un proyecto de pruebas, puedes ejecutar los tests con el siguiente comando:

```bash
dotnet test
```

### Publicar para producción

```bash
dotnet publish --configuration Release --output ./publish
```

Este comando genera los archivos necesarios para desplegar la aplicación en un servidor de producción.

## Interacción con RabbitMQ

- La aplicación expone un endpoint HTTP que recibe un mensaje y lo envía a RabbitMQ.
- RabbitMQ distribuye los mensajes a diferentes consumidores suscritos a los tópicos correspondientes.

## Despliegue

Para desplegar la aplicación en un entorno de producción:
1. Ejecuta el comando `dotnet publish` para generar los archivos optimizados.
2. Despliega los archivos en un servidor web compatible o usa Docker si es necesario.
3. Configura RabbitMQ para que esté accesible desde tu servidor.

## Personalización

Si necesitas cambiar configuraciones adicionales (como los tópicos de RabbitMQ), puedes modificar el archivo `appsettings.json` en la raíz del proyecto `PublicadorAplicacion`.
