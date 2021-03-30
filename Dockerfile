FROM ubuntu

MAINTAINER victor@victor@.fr

RUN \
  apt update && \
  export DEBIAN_FRONTEND=noninteractive && \
  apt install -y --no-install-recommends nginx tzdata && \
  apt install -y git && \
  ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
  git clone https://github.com/diranetafen/static-website-example.git && \
  rm -r /var/www/html && \
  mv static-website-example /var/www/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
