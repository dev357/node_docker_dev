FROM node:latest

WORKDIR /usr/src/app

COPY Readme.MD package*.json* ./
RUN npm cache clean --force && npm install

COPY . .

EXPOSE $port

# CMD [ "npm", "run", "start" ]