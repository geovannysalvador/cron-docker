
FROM node:19.2-alpine3.17

# cd al app. aplicacion de destino
WORKDIR /app

# lo que necesitamos para correr la aplicacion

# el destino seria el /app
COPY package.json ./

# Instalar las dependencias de ser necesarias
RUN npm install

# el destino seria el /app
COPY app.js ./

# Para correr necesitamos el comando
CMD [ "node", "app.js" ]






