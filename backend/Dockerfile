FROM node:20.9.0 as build
LABEL authors="author"

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app

COPY package.json ./
COPY yarn.lock ./

RUN yarn install --immutable --immutable-cache --check-cache


COPY . .

FROM node:20.0-alpine as deploy

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

EXPOSE 5000

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/node_modules ./node_modules

COPY . .

#RUN mv /usr/src/app/.env.docker /usr/src/app/.env

RUN npm run build

CMD ["node","dist/main.js"]
