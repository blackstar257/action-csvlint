FROM ubuntu:latest

LABEL version="0.2.0"
LABEL repository="http://github.com/blackstar257/docker-csvlint"
LABEL homepage="http://github.com/blackstar257/docker-csvlint"
LABEL maintainer="Kyle Umstatter <blackstar257@gmail.com>"

RUN apt-get update \
    && apt-get install curl -y \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -L https://github.com/Clever/csvlint/releases/download/0.2.0/csvlint-v0.2.0-linux-amd64.tar.gz | tar xz -C /usr/local/sbin --strip 1 \
    && chmod +x /usr/local/sbin/csvlint 

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
