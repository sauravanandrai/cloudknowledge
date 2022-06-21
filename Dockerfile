FROM centos:latest
MAINTAINER sauravanandrai1@gmail.com
RUN yum install -y httpd \
    zip \
	unzip 
ADD https://www.free-css.com/assets/files/free-css-templates/download/page280/petology.zip	/var/www/html/
WORKDIR /var/www/html
RUN unzip petology.zip 
RUN cp -rvf petology/* .
RUN rm -rf petology petology.zip
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80
