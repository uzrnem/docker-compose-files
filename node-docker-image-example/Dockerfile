FROM node:14
# -alpine3.14

ENV NODE_ENV=production

# Create app directory
WORKDIR /app

COPY package*.json /app

COPY config.docker.js /app/env.js 

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . /app

CMD [ "node", "server.js" ]

EXPOSE 8080
