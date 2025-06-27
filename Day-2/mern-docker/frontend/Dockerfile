FROM node:20-alpine

# Install curl
RUN apk add --no-cache curl

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package*.json ./

RUN npm install

# Bundle app source
COPY . .

# Expose the port the app runs on
EXPOSE 5173

# Start the app
# CMD ["npm", "start"]
CMD ["npm", "run", "dev", "--", "--host"]
# CMD ["npm", "run", "build"]
# CMD ["npm", "run", "start:prod"]
# CMD ["npm", "run", "start:dev"]