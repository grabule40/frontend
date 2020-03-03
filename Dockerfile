FROM node:alpine as builder
ENV CHOKIDAR_USEPOLLING=true
WORKDIR '/app'
COPY package.json .
RUN npm install --silent
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
