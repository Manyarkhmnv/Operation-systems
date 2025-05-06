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
RUN apt-get install bc -y
RUN apt-get install inetutils-ping -y
RUN apt-get install at -y
RUN apt-get install systemctl -y
RUN apt-get install cron -y
RUN apt-get install psmisc -y

RUN systemctl enable atd

RUN passwd -d root

RUN useradd user
RUN passwd -d user

RUN usermod -aG sudo user

WORKDIR /home/user
RUN mkdir lab-5

RUN chown user /home/user

USER user

ENTRYPOINT sudo service atd start && /bin/bash