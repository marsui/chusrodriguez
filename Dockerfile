FROM mhart/alpine-node:latest

ADD package.json /tmp/package.json
WORKDIR /tmp

ENV NODE_ENV=production

RUN npm install
RUN mkdir -p /opt/chusrodriguez && cp -a /tmp/node_modules /opt/chusrodriguez/

ADD api /opt/chusrodriguez/api
ADD dist /opt/chusrodriguez/dist
# TODO Add app

WORKDIR /opt/chusrodriguez

EXPOSE 3000

CMD node api/index.js
