FROM ubuntu:latest AS base

SHELL [ "/bin/bash", "-c" ]

RUN apt-get update

RUN yes | unminimize

RUN apt-get install man-db -y
RUN apt-get install sudo -y
RUN apt-get install passwd -y
RUN apt-get install nano -y
RUN apt-get install vim -y
RUN apt-get install elinks -y

RUN passwd -d root

RUN useradd user
RUN passwd -d user

RUN usermod -aG sudo user

WORKDIR /home/user
RUN mkdir lab-1

USER user

ENTRYPOINT [ "/bin/bash" ]