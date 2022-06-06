# use docker image scanner.
# it is better PID in code
FROM node:18-alpine

RUN apk add --no-cache bash tini curl

# ENV REDIS=http://127.0.0.1

RUN mkdir -p /app
WORKDIR "/app"

ARG NODE_ENV

COPY package*.json ./


RUN npm install -g mongodb
RUN chown -R node:node .
USER node
RUN npm config set unsafe-perm true


# we use npm ci here so only the package-lock.json file is used
RUN npm config list \
    && npm ci \
    && npm cache clean --force;

RUN npm i @nestjs/cli


COPY --chown=node:node . .


RUN cd /app/src
RUN npm link mongodb
# RUN npm link @nestjs/cli

EXPOSE 3000

RUN export NODE_ENV=production


RUN npm run build
# if [ "$NODE_ENV" = "production" ]; \
    # then echo 3; \
    # fi;

# entrypoint frist run and wrap cmd
# tini run as main process and if we SIGINT or SIGTERM
# it will remove node process as zombie process .
ENTRYPOINT [ "/sbin/tini" , "--" ] 
RUN printenv
RUN ls
CMD [ "node" , "dist/main.js" ]; \
# if [ "$NODE_ENV" = "development" ]; \
    # [ "npm" , "run" , "start:dev" ]; \
    # fi;

