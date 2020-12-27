# https://nodejs.org/en/docs/guides/nodejs-docker-webapp/
# prepare NodeJS and NestJS
FROM node:14-alpine as build
WORKDIR /usr/home/build
RUN npm i -g @nestjs/cli
# download node_modules
COPY package*.json ./
RUN npm ci --only=production
# build application
COPY service .
RUN nest build

FROM node:14-alpine as app
WORKDIR /usr/home/app
COPY --from=build /usr/home/build/node_modules ./node_modules
COPY --from=build /usr/home/build/dist ./dist
EXPOSE 8080
CMD [ "node", "-r", "source-map-support/register", "dist/main" ]
