FROM ubuntu:22.04

RUN apt-get update -yq \
    && apt-get install curl gnupg -yq \
    && curl -sL https://deb.nodesource.com/setup_18.x | bash \
    && apt-get install nodejs -yq \
    && apt-get clean -y

ADD . /app/
WORKDIR /app
RUN npm i -g mintlify
RUN npm install --global yarn
#RUN mintlify dev

EXPOSE 2368
#VOLUME /app/logs

CMD mintlify dev