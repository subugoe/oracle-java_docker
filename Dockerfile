#
# Oracle Java 8 Dockerfile
#
# https://github.com/dockerfile/java
# https://github.com/dockerfile/java/tree/master/oracle-java8
#
# Pull base image.
FROM ubuntu:16.04
MAINTAINER  Arash Samadi (samadi@sub.uni-goettingen.de)

# Set environment variables.
ENV HOME /root
ARG JAVA_VERSION
# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-${JAVA_VERSION}-oracle
ENV APT_INSTALL "apt install --assume-yes --no-install-recommends"

# Pre-Install
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt update && \
  apt --assume-yes upgrade && \
  ${APT_INSTALL} build-essential && \
  ${APT_INSTALL} software-properties-common && \
  ${APT_INSTALL} byobu curl git htop man unzip vim wget

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Install Java.
RUN \
  echo oracle-java${JAVA_VERSION}-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt update && \
  ${APT_INSTALL} oracle-java${JAVA_VERSION}-installer oracle-java${JAVA_VERSION}-set-default && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk${JAVA_VERSION}-installer

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
