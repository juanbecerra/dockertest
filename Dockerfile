FROM node:alpine
WORKDIR /u01/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /u01/app/build /usr/share/nginx/html
