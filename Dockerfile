FROM node:alpine as builder
WORKDIR /app
COPY package.json .
COPY package-lock.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
