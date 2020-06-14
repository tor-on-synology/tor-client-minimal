FROM alpine:latest

RUN apk update \
 && apk upgrade \
 && apk add tor --update-cache --repository http://dl-4.alpinelinux.org/alpine/edge/community/ --allow-untrusted \
 && apk add bash \
 && rm /var/cache/apk/*

EXPOSE 9150

ADD ./torrc /etc/tor/torrc

USER tor
CMD /usr/bin/tor -f /etc/tor/torrc
