FROM alpine:3.8
MAINTAINER Sean Wenzel <sean@infinitenetworks.com>
LABEL Description="Runtime configurable SSH Tunnel based on the lightweight Alpine Linux docker image"

RUN apk --update add openssh-client \
    && rm -f /var/cache/apk/*

# Security fix for CVE-2016-0777 and CVE-2016-0778
RUN echo -e 'Host *\nUseRoaming no' >> /etc/ssh/ssh_config \
    && mkdir ~/.ssh

ADD files/run.sh app/

RUN chmod +x /app/run.sh

ENTRYPOINT ["/app/run.sh"]