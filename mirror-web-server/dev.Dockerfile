FROM node:18
WORKDIR /app

RUN npm i -g @nestjs/cli
# yarn configuration files
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
EXPOSE 3000 9000 9001 8080
ENTRYPOINT ["sh", "-c", "yarn migrate:up && yarn build && yarn dev"]
