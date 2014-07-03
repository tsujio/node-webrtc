#
# Dockerfile for node-webrtc
#

FROM ubuntu:latest
MAINTAINER tsujio

WORKDIR /opt

# Install required packages
RUN apt-get update -y
RUN apt-get install -y git
RUN apt-get install -y python python-dev python-pip python-virtualenv
RUN apt-get install -y subversion
RUN apt-get install -y pkg-config
RUN apt-get install -y g++
RUN apt-get install -y libnss3-dev
RUN apt-get install -y libasound2-dev
RUN apt-get install -y libpulse-dev
RUN apt-get install -y libjpeg62-dev
RUN apt-get install -y libxv-dev
RUN apt-get install -y libgtk2.0-dev
RUN apt-get install -y libexpat1-dev
RUN apt-get install -y libcups2-dev
RUN apt-get install -y libexif-dev
RUN apt-get install -y libxss-dev
RUN apt-get install -y libgnome-keyring-dev
RUN apt-get install -y libudev-dev
RUN apt-get install -y libdrm-dev
RUN apt-get install -y libgconf2-dev
RUN apt-get install -y libgcrypt11-dev
RUN apt-get install -y libpci-dev
RUN apt-get install -y libxtst-dev
RUN apt-get install -y curl

# Install Node.js and npm
RUN curl http://nodejs.org/dist/v0.10.29/node-v0.10.29-linux-x64.tar.gz | tar xvz
ENV PATH $PATH:/opt/node-v0.10.29-linux-x64/bin
ENV NODE_PATH /opt/node-v0.10.29-linux-x64/lib/node_modules

# Install node-webrtc
RUN git clone https://github.com/js-platform/node-webrtc.git
RUN cd node-webrtc && npm install -g
RUN npm install -g tape node-pre-gyp ws node-static-alias minimist

CMD cd $NODE_PATH/wrtc && npm test
