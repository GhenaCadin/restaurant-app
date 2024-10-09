# Step 1: Build the React app
FROM node:22-alpine AS build

# Set the working directory inside the container to the 'client' folder
WORKDIR /client

# Copy the package.json and package-lock.json files to install dependencies
COPY package*.json ./

# Install the app dependencies
RUN npm install

# Copy the rest of the project files into the working directory
COPY . .

# Build the React app for production
RUN npm run build

# Step 2: Serve the app using Nginx
FROM nginx:alpine

# Copy the built files from the previous step to the Nginx public folder
COPY --from=build /client/build /usr/share/nginx/html

# Expose port 80 to access the application
EXPOSE 80:80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
