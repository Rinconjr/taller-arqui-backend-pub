# Etapa de construcción
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /source

# Copiar los archivos .csproj y restaurar las dependencias
COPY *.sln . 
COPY CommunWork/CommunWork.csproj CommunWork/
COPY PublicadorAplication/PublicadorAplication.csproj PublicadorAplication/

RUN dotnet restore

# Copiar todo el código fuente y construir el proyecto
COPY . .
WORKDIR /source/PublicadorAplication
RUN dotnet publish -c Release -o /app

# Etapa de producción
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /app
COPY --from=build /app .

# Exponer los puertos HTTP (5148) y HTTPS (7108)
EXPOSE 5148
EXPOSE 7108

# Configurar la aplicación para que escuche en los puertos correctos
ENV ASPNETCORE_URLS="http://+:5148;https://+:7108"

# Configurar la variable de entorno para el entorno de desarrollo
ENV ASPNETCORE_ENVIRONMENT=Development

# Comando de inicio
ENTRYPOINT ["dotnet", "PublicadorAplication.dll"]
