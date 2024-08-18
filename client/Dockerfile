#Set the node js version
FROM node:20 AS build

#Set working directory
WORKDIR /app

# Copy JSON file
COPY package*.json .

#Install all dependencies
RUN npm install

# Copy all the files
COPY . .

RUN npm run build

FROM nginx:alpine

COPY --from=build /app/dist/ /usr/share/nginx/html/

EXPOSE 80