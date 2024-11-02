FROM node:20-alpine3.18 as builder

RUN apk add --no-cache libc6-compat

WORKDIR /app

COPY . .

RUN if [ -d node_modules ]; then rm -rf node_modules; fi
RUN if [ -f package-lock.json ]; then rm -f package-lock.json; fi
RUN if [ -f yarn.lock ]; then rm -f yarn.lock; fi

ENV NODE_ENV=production

RUN yarn install
RUN yarn add -D tailwindcss postcss
#RUN npx tailwindcss init
RUN yarn build

# delete src folder
 RUN if [ -d src ]; then rm -rf src; fi

EXPOSE 3000
CMD ["yarn", "start"]

