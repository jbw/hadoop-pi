#!/bin/bash


echo 'Installing system dependencies'

sudo apt-get update -y

sudo apt-get install -y oracle-java8-jdk net-tools openssh-server wget vim git

# Install hadoop binary
echo 'Installing Hadoop'

wget https://github.com/jbw/build-hadoop/releases/download/3.0.3-armv7l/hadoop-3.0.3.tar.gz && tar -xzvf hadoop-3.0.3.tar.gz && mv hadoop-3.0.3 /usr/local/hadoop

mkdir -p ~/hdfs/namenode && \
mkdir -p ~/hdfs/datanode && \
mkdir $HADOOP_HOME/logs

cp ./hadoop-config/ssh_config ~/.ssh/config && \
cp ./hadoop-config/hadoop-env.sh /usr/local/hadoop/etc/hadoop/hadoop-env.sh && \
cp ./hadoop-config/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml && \
cp ./hadoop-config/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml && \
cp ./hadoop-config/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml && \
cp ./hadoop-config/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml && \
cp ./hadoop-config-master/slaves $HADOOP_HOME/etc/hadoop/slaves && \
cp ./hadoop-config/start-hadoop.sh ~/start-hadoop.sh && \

chmod +x ~/start-hadoop.sh && \
chmod +x $HADOOP_HOME/sbin/start-dfs.sh && \
chmod +x $HADOOP_HOME/sbin/start-yarn.sh && \

echo 'Formatting Hadoop NameNode'
echo $JAVA_HOME
/usr/local/hadoop/bin/hdfs namenode -format