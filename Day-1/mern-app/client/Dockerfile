# Step 1: Build the React App
# This stage is responsible for building the React app in production mode.

# Use the official Node.js image (version 18) for building the app
FROM node:18 AS build

# Set the working directory inside the container to /app
# All following commands will be executed inside this directory
WORKDIR /app

# Copy the package.json and package-lock.json files into the container
# This ensures we can install all the dependencies without copying the entire project first (better for caching)
COPY package*.json ./

# Install the dependencies listed in package.json
RUN npm install

# Copy the rest of the app's source code into the container
# This copies everything from the local directory (.) into the /app directory in the container
COPY . .

# Run the build command to create the production-ready React app
# This will create a 'build' folder containing static assets (HTML, CSS, JS) ready for serving
RUN npm run build


# Step 2: Serve the React App with Nginx
# After building the app, we switch to a minimal Nginx image to serve the static files.

# Use the official Nginx image (based on Alpine for smaller image size)
FROM nginx:alpine

# Copy the production build files from the build stage (created in Step 1)
# --from=build: refers to the build stage we named earlier
# /app/build: This is where the build command placed the compiled files
# /usr/share/nginx/html: This is the default directory Nginx uses to serve static files
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 to the outside world so the app can be accessed in the browser
EXPOSE 80

# Command to run Nginx in the foreground (so that Docker keeps the container running)
# Without this, Nginx would run in the background and the container would stop immediately
CMD ["nginx", "-g", "daemon off;"]
