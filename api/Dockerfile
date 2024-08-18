#Set the node js version
FROM node:22.5.1-alpine

#Set working directory
WORKDIR /app

# Copy JSON file
COPY package*.json .

#Install all dependencies
RUN npm install

# Copy all the files
COPY . .

#Expose the PORT
EXPOSE 4000

# Command
CMD ["node", "index.js"]

