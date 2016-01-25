FROM ubuntu:14.04

MAINTAINER Oscar Gómez

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git build-essential libtool autoconf automake pkg-config unzip libkrb5-dev curl wget
RUN cd /tmp && git clone git://github.com/jedisct1/libsodium.git && cd libsodium && git checkout e2a30a && ./autogen.sh && ./configure && make check && make install && ldconfig
#RUN cd /tmp && git clone --depth 1 git://github.com/zeromq/libzmq.git && cd libzmq && ./autogen.sh && ./configure && make
# RUN cd /tmp/libzmq && make check

RUN cd /tmp && wget http://download.zeromq.org/zeromq-4.1.4.tar.gz
RUN cd /tmp && tar xzvf zeromq-4.1.4.tar.gz
RUN cd /tmp/zeromq-4.1.4 && ./configure && make && make install

RUN cd /tmp/libzmq && make install && ldconfig
RUN rm /tmp/* -rf
