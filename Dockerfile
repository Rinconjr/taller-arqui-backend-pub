# Etapa de construcción
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /source

# Copiar la solución y los archivos del proyecto
COPY backend-pub-sub.sln .
COPY CommunWork/CommunWork.csproj CommunWork/
COPY PublicadorAplication/PublicadorAplication.csproj PublicadorAplication/

# Restaurar dependencias
RUN dotnet restore

# Copiar todo el código fuente
COPY . .

WORKDIR /source/PublicadorAplication

# Publicar la aplicación
RUN dotnet publish -c Release -o /app

# Etapa de ejecución
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Copiar los archivos publicados de la etapa de construcción
COPY --from=build /app .

# Establecer el ENTRYPOINT para ejecutar la aplicación
ENTRYPOINT ["dotnet", "PublicadorAplication.dll"]
