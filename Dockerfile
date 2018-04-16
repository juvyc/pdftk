FROM ubuntu:14.04.4

ENV DEBIAN_FRONTEND noninteractive
ENV UBUNTU_VERSION 14.04.4

RUN sudo apt-get update
RUN sudo apt-get install pdftk
