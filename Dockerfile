# FROM node:20-alpine

# WORKDIR /app

# # Copier uniquement les fichiers de dépendances
# COPY ./app/package.json ./app/package-lock.json ./

# # Installer les dépendances
# RUN npm install

# # Copier tout le projet
# COPY ./app .

# EXPOSE 3000

# CMD ["npm", "run", "dev"]

FROM node:20-alpine

WORKDIR /app

# Outils utiles (optionnel mais pratique) + compat souvent attendue par Expo
RUN apk add --no-cache bash

# Dépendances
COPY ./app/package.json ./app/package-lock.json ./
RUN npm install

# Code
COPY ./app .

# Ports Expo courants
EXPOSE 8081 19000 19001 19002

# Lancer Expo en écoutant sur le réseau
CMD ["npx", "expo", "start", "--tunnel"]
