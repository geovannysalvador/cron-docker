
# Primera etapa
# dependencias de desarrollo
# -------------------------------------------------

# FROM --platform=linux/amd64 node:19.2-alpine3.17
FROM node:19.2-alpine3.17 as deps
# FROM --platform=$BUILDPLATFORM node:19.2-alpine3.17

# cd al app. aplicacion de destino
WORKDIR /app

# el destino seria el /app
COPY package.json ./

# Instalar las dependencias de ser necesarias
RUN npm install

# -------------------------------------------------




# Segunda etapa
# builder y test aca empieza uno nuevo 
# Imagen desde cero
# -------------------------------------------------

FROM node:19.2-alpine3.17 as builder

# cd al app. aplicacion de destino
WORKDIR /app

# HAcer referencia a la etapa anterior
# RUN npm install no se usa eso sino que se va a traer del paso anterior con:
COPY --from=deps /app/node_modules ./node_modules

COPY . .

# Ejecutar el test

RUN npm run test

# -------------------------------------------------





# tercera etapa
# Dependecias de produccion
# -------------------------------------------------

FROM node:19.2-alpine3.17 as prod-deps
WORKDIR /app
COPY package.json ./
# Intalar unicamente las dev de produccion 
RUN npm install --prod

# -------------------------------------------------





# cuarta etapa
# Ejecutar la app en si
# -------------------------------------------------

FROM node:19.2-alpine3.17 as runner

WORKDIR /app

# Referencia a un paso anterior
COPY --from=prod-deps /app/node_modules ./node_modules

# copia lo que necesito del proyecto para hacer la imagen
COPY app.js ./
# Si no esta la carpeta la crea pero copia lo que tengo en esa nueva carpeta
COPY tasks/ ./tasks

# Para correr necesitamos el comando
CMD [ "node", "app.js" ]






