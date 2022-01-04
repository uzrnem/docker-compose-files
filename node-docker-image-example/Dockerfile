FROM node:16-alpine3.14

ENV NODE_ENV=production

# Create app directory
WORKDIR /app

COPY package.json package.json

RUN npm install

COPY server.js server.js

EXPOSE 9050

CMD [ "node", "server.js" ]