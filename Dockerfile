# Frontend Dockerfile
FROM node:14

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 80

CMD ["npm", "start"]

# Backend Dockerfile
FROM mysql:5.7

ENV MYSQL_ROOT_PASSWORD=Sandip4059#
ENV MYSQL_DATABASE=testdb

COPY setup.sql /docker-entrypoint-initdb.d/

EXPOSE 3306
