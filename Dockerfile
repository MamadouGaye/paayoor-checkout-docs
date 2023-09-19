#FROM ubuntu:22.04

#RUN apt-get update -yq \
    #&& apt-get install curl gnupg -yq \
    #&& curl -sL https://deb.nodesource.com/setup_18.x | bash \
    #&& apt-get install nodejs -yq \
    #&& apt-get clean -y

#ADD . /app/
#WORKDIR /app
#RUN npm install --ignore-scripts=false --foreground-scripts --verbose sharp
#RUN npm install --arch=arm64 --platform=linuxmusl sharp
#RUN npm i -g mintlify@3
#RUN npm install --global yarn
#RUN npm install
#RUN mintlify install
#RUN mintlify dev

#EXPOSE 3000
#EXPOSE 2368
#VOLUME /app/logs

#CMD mintlify dev
#CMD [ "npm", "restart" ]

# Utilisez une image de node.js en tant que base
FROM node:18

# Créez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez les fichiers du projet dans le conteneur
COPY . .

# Installez les dépendances du projet
RUN npm install
#RUN npm install --arch=x64 --platform=linux sharp
RUN npm i -g mintlify@3

# Exposez le port 3000 (ou le port de votre choix)
EXPOSE 3000

# Commande pour lancer l'application en mode développement
#CMD ["npm", "run", "dev"]
CMD ["mintlify", "dev"]
