# Pull Alpine Linux Image
FROM alpine:latest

# Creating and setting app dir
RUN mkdir /commander
WORKDIR /commander

# Copy all elements to the image see .dockerignore
COPY . .

# Installing nodejs
RUN apk add --update nodejs npm

# Installing yarn
RUN npm install --global yarn

RUN yarn install

# Exposing app port
EXPOSE 5001

# Install dependencies and start the app
ENTRYPOINT [ "sh", "-c" ]
CMD [ "yarn start" ]
