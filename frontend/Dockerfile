FROM node:20.9.0 as build
LABEL authors="author"

## Set working directory
WORKDIR /app

## Copy package.json file to the working directory
COPY package.json .

## Run yarn install to install dependencies
RUN yarn install

## Copy everything in current folder to working directory
COPY . .

#RUN mv /app/.env.docker.example /app/.env

## Run yarn build, to build react app
RUN npm run build

FROM nginx:alpine as deploy

EXPOSE 3000

# Copy default conf file to nginx
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# Delete the default welcome to nginx page.
RUN rm /usr/share/nginx/html/*

#COPY --from=build /app/.env /usr/share/nginx/html/.env
## Copy the built react app project to the nginx config directory
COPY --from=build /app/build /usr/share/nginx/html
