#!/bin/bash

# Init
mkdir -p ~/soft

# Java 11
wget -P ~/soft https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz &&

tar -C ~/soft -zxf soft/openjdk-11.0.2_linux-x64_bin.tar.gz &&

echo "export JAVA_HOME=~/soft/jdk-11.0.2
export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc

# Maven
MAVEN_VERSION=3.6.3
wget -P ~/soft http://ftp.byfly.by/pub/apache.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.zip &&

unzip -q -d soft/ soft/apache-maven-$MAVEN_VERSION-bin.zip &&

echo "export M2_HOME=~/soft/apache-maven-$MAVEN_VERSION
export PATH=\$M2_HOME/bin:\$PATH" >> ~/.bashrc

# Docker
USER_NAME=asavitsky
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" &&
apt-get install docker-ce docker-ce-cli containerd.io &&

usermod -aG docker $USER_NAME

# Reload .bashrc
source ~/.bashrc
