# Usa una imagen base de Node.js
FROM node:latest

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /node-red-modified

# Copia los archivos package.json y package-lock.json al directorio de trabajo en el contenedor
COPY package*.json ./

# Instala las dependencias del proyecto especificadas en package.json
RUN npm install --legacy-peer-deps

# Copia todo el código fuente de la aplicación al directorio de trabajo en el contenedor
COPY . .

# Ejecuta el script de construcción del proyecto
RUN npm run build

# Expone el puerto 1880 en el contenedor
EXPOSE 1880

# Define el comando por defecto para ejecutar cuando el contenedor se inicie
CMD ["npm", "start"]
