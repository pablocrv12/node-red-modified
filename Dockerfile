# Usa una imagen base de Node.js
FROM node:latest

# Instala git
# RUN apt-get update && apt-get install -y git && apt-get clean

# RUN git clone https://github.com/pablocrv12/node-red-modified

WORKDIR /node-red-modified

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 1880

CMD ["npm", "start"]

# construir con: docker build --no-cache -t node-red-modified:latest .

# ejecutar con: docker run -d -e JWT_TOKEN="${token}" --name nodered-${userId} -p 1880:1880 node-red-modified:latest