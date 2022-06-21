FROM centos
MAINTAINER sauravanandrai1@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum install -y httpd
RUN yum install -y   zip
RUN yum install -y      unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page280/petology.zip      /var/www/html
WORKDIR /var/www/html
RUN unzip petology.zip
RUN cp -rvf petology-html/* .
RUN rm -rf petology-html petology.zip
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80
