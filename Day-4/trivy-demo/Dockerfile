FROM node:18-slim

WORKDIR /usr/src/app

RUN apt-get update && apt-get upgrade -y && apt-get clean

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

EXPOSE 3000

CMD ["node", "app.js"]
