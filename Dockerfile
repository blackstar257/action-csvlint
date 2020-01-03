FROM curlimages/curl

LABEL version="0.2.0"
LABEL repository="http://github.com/blackstar257/docker-csvlint"
LABEL homepage="http://github.com/blackstar257/docker-csvlint"
LABEL maintainer="Kyle Umstatter <blackstar257@gmail.com>"

RUN curl -L https://github.com/Clever/csvlint/releases/download/0.2.0/csvlint-v0.2.0-linux-amd64.tar.gz | tar xz -C /tmp/ --strip 1 \
    && chmod +x /tmp/csvlint 

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]