FROM node:10-alpine

WORKDIR /usr/src/app

RUN npm install yarn -g

COPY package.json /usr/src/app

RUN yarn

COPY . .

CMD ["yarn", "start"]

EXPOSE 3000