FROM ubuntu
MAINTAINER Iurie Muradu "muradu.iurie.1986@gmail.com"
RUN apt update; apt install nginx vim curl -y;
WORKDIR /etc/nginx
COPY weazel sites-available/weazel
RUN ln sites-available/weazel sites-enabled/weazel; unlink sites-enabled/default    
COPY weazel_dir/ /var/www/weazel
EXPOSE 80 443
CMD ["nginx","-g","daemon off;"]
