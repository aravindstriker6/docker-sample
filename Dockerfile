FROM node:alpine as teamalpha
WORKDIR /var/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


From nginx
Expose 80
COPY --from=teamalpha /var/app/build /usr/share/nginx/html