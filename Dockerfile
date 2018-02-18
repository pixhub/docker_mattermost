FROM debian:9-slim

ENV PATH=$PATH:/opt/mattermost/bin

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl \
                       wget && \
    useradd -ms /bin/bash mattermost && \
    chown -R 1000:1000 /opt

USER mattermost

RUN cd /opt && \
    wget https://releases.mattermost.com/4.7.0/mattermost-4.7.0-linux-amd64.tar.gz && \
    tar xzvf mattermost*.gz && \
    rm -rf mattermost*.gz && \
    mkdir /opt/mattermost/data

COPY files /

CMD ["/run.sh"]
