# Dockerfile to containerize an apache web application
# Base image
FROM centos:7

# Description
LABEL description="Dockerfile to containerize the coffee web app"

# update all packages
RUN yum -y update

# install apache
RUN yum install -y httpd

#Copy web app from local to the container
COPY ./coffee-webapp/ /var/www/html/

# port on which the app should listen on
EXPOSE 80

# systemctl start httpd
# CMD or ENTRYPOINT
ENTRYPOINT [ "/usr/sbin/httpd" ]

# Run the container in the background
CMD ["-D", "FOREGROUND"]