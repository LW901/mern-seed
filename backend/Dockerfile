# Development

# Use Node.js 18 on Alpine Linux (small and efficient)
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /backend

# Copy package.json and yarn.lock (if present) to the container
COPY package*.json /backend/

# Install dependencies using Yarn
RUN yarn install

# Copy the rest of the application code
COPY . /backend/

# Expose port 3001 (so it can be accessed externally)
EXPOSE 3001

# Run the app using Yarn
CMD ["yarn", "start"]
