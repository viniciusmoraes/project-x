FROM ubuntu:16.04
MAINTAINER Vinicius Paolozza

# Create app directory
RUN mkdir -p /usr/src/application
WORKDIR /usr/src/application

# Bundle app source
#ADD . /usr/src/application

# Install app dependencies
COPY . /usr/src/application/
RUN apt-get -qq update && apt-get -qq -y install bzip2
#RUN apt-get update && apt-get -y upgrade
#RUN apt-get install -y \
#  git \
#  curl \
#  ruby

RUN apt-get install -y \
  nodejs \
  npm

#RUN gem install sass

RUN npm install -g \
  gulp-cli \
  bower

RUN npm install gulp -D

#RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install
RUN bower --allow-root --config.interactive=false install

EXPOSE 8080
EXPOSE 3000
EXPOSE 3001
EXPOSE 35729

VOLUME /usr/src/application/

CMD gulp default
