# Use Node image
FROM node:18

# Create app directory
WORKDIR /app

# Copy package files and install
COPY package*.json ./
RUN npm install

# Copy app source
COPY . .

# Expose port and start server
EXPOSE 5000
CMD ["node", "server.js"]

