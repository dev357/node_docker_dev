# Get started

First start the empty node container
```console
$ docker-compose run --rm --name node node node
```

then use another shell and create a new node project
```console
$ docker container exec -it node bash
$ npm init
```

Stop the container in the first shell
```javascript
.exit
```

Uncomment the CMD in the Dockerfile
```dockerfile
CMD [ "npm", "run", "start" ]
```

Run the container with docker-compose
```console
$ docker-compose up
```

# Notes
- When you create a project in a separate folder(ie for create-react-app) you need to change the folders in the Dockerfile accordingly
  ```dockerfile
  FROM node:latest

  WORKDIR /usr/src/app/frontend

  COPY Readme.MD frontend/package*.json* ./
  RUN npm cache clean --force && npm install

  COPY ./frontend .

  EXPOSE $port

  CMD [ "npm", "run", "start" ]
  ```