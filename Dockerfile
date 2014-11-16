# https://github.com/phusion/baseimage-docker
FROM phusion/baseimage:0.9.15

# blame this guy
MAINTAINER Bryan Bishop <kanzure@gmail.com>

# environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV LANG C.UTF-8
ENV LC_ALL C

# disable dpkg fsync to make zoom fast
ADD ./container/etc/dpkg/dpkg.cfg.d/02apt-speedup /etc/dpkg/dpkg.cfg.d/02apt-speedup

# because bitcoin package metadata
ADD ./container/etc/apt/sources.list.d/bitcoin.list /etc/apt/sources.list.d/bitcoin.list

# learn about some bitcoin signatures
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8842ce5e

# update package metadata
RUN apt-get update -y

# store system-level package requirements in /tmp
ADD ./requirements-docker.apt /tmp/requirements-docker.apt

# Install whatever packages are required to run this thing. Filter out lines
# beginning with "#" because they are comments.
RUN apt-get install -y $(cat /tmp/requirements-docker.apt | grep -v "^#")

# store build-related package requirements in /tmp
ADD ./requirements-docker-build.apt /tmp/requirements-docker-build.apt

# install requirements for the remainder of this "docker build"
RUN apt-get install -y $(cat /tmp/requirements-docker-build.apt | grep -v "^#")

# install pip3
RUN wget -q -O - https://bootstrap.pypa.io/get-pip.py | python3

# install python-related requirements
ADD ./requirements.pip /tmp/requirements.pip
RUN pip3 install -r /tmp/requirements.pip

# reorgcompatservice will be stored in /app
RUN mkdir /app
WORKDIR /app

ADD ./setup.py /app/setup.py
ADD ./MANIFEST.in /app/MANIFEST.in

# place source code at /app/reorgcompatservice
ADD ./reorgcompatservice /app/

# create symlinks for python to find reorgcompatservice source code
RUN cd /app/reorgcompatservice/ && python3 setup.py develop
