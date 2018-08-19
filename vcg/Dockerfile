#
#  docker pull registry.docker-cn.com/library/ubuntu:16.04
#

# Pull base image.
FROM ubuntu:16.04

ARG DEBIAN_FRONTEND=noninteractive

ENV LANG=C.UTF-8

RUN useradd vcg -p vcg -s /bin/bash

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install.

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get -y upgrade \
    && apt-get install -y dialog \
    && apt-get install -y build-essential \
    && apt-get install -y software-properties-common \
    && apt-get install -y aptitude \
    && aptitude install sudo \
    && echo 'vcg ALL=(ALL)  NOPASSWD:ALL' >> /etc/sudoers

RUN \
  apt-get install -y byobu curl git htop man unzip vim wget \
  && apt-get install -y bash-completion \
  && apt-get install -y software-properties-common python-software-properties

RUN echo 'Install Nodejs.....'

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - \
  && apt-get install -y nodejs

COPY bashrc /home/vcg/.bashrc
COPY id_rsa /home/vcg/.ssh/id_rsa
COPY id_rsa.pub /home/vcg/.ssh/id_rsa.pub

# Make WorkSpace
RUN \
  mkdir -p /home/vcg/.ssh/  \
  && chmod 644 /home/vcg/.ssh/id_rsa.pub\
  && chmod 700 /home/vcg/.ssh \
  && chown vcg:vcg /home/vcg -R



USER vcg 
WORKDIR /home/vcg

#启动后执行此脚本

CMD /bin/bash 

RUN echo 'thanks for building'
