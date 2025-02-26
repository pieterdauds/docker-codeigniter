FROM centos:latest
RUN yum install httpd -y
RUN yum install epel-release yum-utils -y
RUN yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
RUN yum-config-manager --enable remi-php73
RUN yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd php-zip unxip gunzip -y
COPY html /var/www/html/
RUN chown -R apache:apache /var/www/html/
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80
