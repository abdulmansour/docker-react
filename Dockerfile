# /app/build <---- will contain all the production assets to be hosted to the outside world
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM  nginx
COPY --from=builder /app/build /usr/share/nginx/html