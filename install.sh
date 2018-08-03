#!/bin/bash


sudo apt-get update

sudo apt-get install -y openssh-server wget

sudo apt-get install -y software-properties-common debconf-utils net-tools vim git

sudo apt-get install libtool

sudo apt-get install oracle-java8-jdk

wget https://github.com/jbw/build-hadoop/releases/download/3.0.3-armv7l/hadoop-3.0.3.tar.gz
tar -xzvf hadoop-3.0.3.tar.gz
mv hadoop-3.0.3 /usr/local/hadoop

/usr/local/hadoop/bin/hdfs namenode -format