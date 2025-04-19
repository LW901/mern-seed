# Development

# Use Node.js 18 on Alpine Linux (lightweight and efficient)
FROM node:18-alpine

# Install system dependencies needed for building native modules
RUN apk add --no-cache g++ make py3-pip

# Set the working directory inside the container
WORKDIR /frontend

# Copy package.json and yarn.lock files first (for better caching of dependencies)
COPY package*.json /frontend/

# Install JavaScript dependencies using Yarn
RUN yarn install

# Copy the rest of the application source code into the container
COPY . /frontend/

# Expose the frontend development server port (typically used by React, Vite, etc.)
EXPOSE 3000

# Expose LiveReload/hot-reload port (commonly used for dev server tooling)
EXPOSE 35729

# Start the frontend development server
CMD ["yarn", "start"]