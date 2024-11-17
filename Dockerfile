# Use an official Node.js runtime as a parent image
FROM node:16
# Set the working directory inside the container
WORKDIR /app
# Copy package.json and package-lock.json into the container
COPY package*.json ./

# Install app dependencies
RUN npm install
COPY . .
EXPOSE 5173

# Step 7: Start the development server
CMD ["npm", "run", "dev"]
