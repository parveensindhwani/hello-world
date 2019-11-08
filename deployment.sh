#!/bin/bash

echo "Git Checkout"

if [ ! -d "hello-world" ];then

echo "Directory not exist"

git clone https://github.com/parveensindhwani/hello-world.git
cd hello-world

else

echo "Directory already there"
cd hello-world
git pull

fi

echo "Compilation"
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.232.b09-0.el7_7.x86_64
export MAVEN_HOME=/opt/apache-maven-3.6.2/bin
export PATH=$PATH:$MAVEN_HOME:$JAVA_HOME
mvn clean install package
cd ..

if [ ! -d "apache-tomcat-8.5.47" ];then
echo "Installing Apache Tomcat"
wget http://apachemirror.wuchna.com/tomcat/tomcat-8/v8.5.47/bin/apache-tomcat-8.5.47.tar.gz
tar -xzvf apache-tomcat-8.5.47.tar.gz

else
echo "Tomact is already installed"
fi
echo "Deployment"
ps aux |grep "apache-tomcat" |grep -v "grep"

if [[ $? -ne 0 ]];then
echo "Tomcat is not running"
pwd
cp hello-world/webapp/target/webapp.war apache-tomcat-8.5.47/webapps/
apache-tomcat-8.5.47/bin/startup.sh

else
echo "Tomcat is running"
apache-tomcat-8.5.47/bin/shutdown.sh
cp hello-world/webapp/target/webapp.war apache-tomcat-8.5.47/webapps/
apache-tomcat-8.5.47/bin/startup.sh

fi
