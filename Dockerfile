FROM centos:7
MAINTAINER Valentin Andriès <valentin.andries@music-story.com>

RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install nginx
RUN yum clean all

RUN mkdir -p /etc/nginx/sites
ADD nginx.conf /etc/nginx/

#RUN mkdir -p /etc/nginx/{sites-available,sites-enabled}
#ADD www.conf /etc/nginx/sites-available/
#RUN ln -s /etc/nginx/sites-available/www.conf /etc/nginx/sites-enabled/www.conf

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

CMD ["/usr/sbin/nginx"]

VOLUME "/etc/nginx/sites"

EXPOSE 80
