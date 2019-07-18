FROM node:9.0
WORKDIR /app
ADD . /app
RUN npm install
EXPOSE 3000
CMD npm start