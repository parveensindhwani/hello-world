# base image
# webhook test10
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "ParveenSindhwani89@gmail.com" 
COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps
