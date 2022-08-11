FROM node:16 as build

WORKDIR /usr/src/app

COPY package*.json .
RUN npm install
COPY index.js .
COPY lib ./lib

FROM alpine:latest
ENV PORT=3000
EXPOSE 3000

RUN apk update && apk --no-cache add nodejs
COPY --from=build /usr/src/app/ /app

CMD ["node", "/app/node_modules/.bin/micro", "/app/index.js"]