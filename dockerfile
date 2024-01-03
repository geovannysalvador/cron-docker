
FROM node:19.2-alpine3.17

# cd al app. aplicacion de destino
WORKDIR /app

# lo que necesitamos para correr la aplicacion

# el destino seria el /app
COPY package.json ./

# Instalar las dependencias de ser necesarias
RUN npm install

# # el destino seria el /app
# COPY app.js ./

# copiar el task y el test
COPY . .

# Comando para es testing o test
RUN npm run test

# Eliminar archivos y directorios no necesarios en img/produccion
RUN rm -rf test && rm -rf node_modules

# Intalar unicamente las dev de produccion 
RUN npm install --prod

# Para correr necesitamos el comando
CMD [ "node", "app.js" ]






