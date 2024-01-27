# Use the official Node.js image
FROM node:16

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the application files to the working directory
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the Node.js application
CMD ["node", "app.js"]