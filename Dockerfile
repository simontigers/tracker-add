FROM alpine:latest

RUN apk add --no-cache tzdata

ENV TZ=Asia/Shanghai
ENV TORRENTLIST=https://cdn.jsdelivr.net/gh/ngosang/trackerslist@master/trackers_all.txt

ADD ./tracker-add.sh .
RUN apk add --update \
        bash transmission-cli curl coreutils && \
        chmod +x tracker-add.sh

USER guest
ENTRYPOINT [ "/bin/sh", "tracker-add.sh" ]
