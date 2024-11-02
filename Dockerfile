FROM node:20-alpine3.18 as builder

RUN apk add --no-cache libc6-compat

WORKDIR /app

COPY package.json .

RUN yarn install --production

COPY . .

ENV NODE_ENV=production

RUN yarn build

EXPOSE 3000

CMD ["yarn", "start"]

