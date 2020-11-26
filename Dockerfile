FROM node:15.2-alpine

# set work directory
WORKDIR /app

# add node_modules/.bin to the $PATH
ENV PATH $PATH:/app/node_modules/.bin
ENV CHOKIDAR_USEPOLLING=true

# install dependencies
COPY package-lock.json ./
COPY package.json ./
RUN npm install

# add app
COPY . ./

# start app
CMD ["npm", "start"]