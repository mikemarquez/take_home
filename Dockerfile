# Use Node.js 18 as the base image
FROM node:18-slim

# Set working directory
WORKDIR /app

# Install system dependencies required for electron-builder
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Copy package files
COPY package*.json ./
COPY yarn.lock ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build the application
RUN npm run build

# Set the default command
CMD ["npm", "run", "package:mac:zip"] 