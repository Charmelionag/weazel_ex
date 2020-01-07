FROM ubuntu
MAINTAINER Iurie Muradu "muradu.iurie.1986@gmail.com"
RUN apt update; apt install nginx vim curl -y;
WORKDIR /etc/nginx
COPY weazel sites-available/weazel
RUN ln sites-available/weazel sites-enabled/weazel; unlink sites-enabled/default    
COPY weazel_dir/ /var/www/weazel
EXPOSE 80 443
ENV ROOT_MYSQL_PASSWORD="password"
RUN apt install mysql-server mysql-client libmysqlclient-dev -y
RUN apt install php php-common php-curl php-dev php-gd php-pear php-imagick php-mcrypt php-mysql php-ps php-xsl -y
RUN apt install php-myadmin
CMD ["nginx","-g","daemon off;"]
