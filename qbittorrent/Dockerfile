FROM alpine:latest

RUN apk add --no-cache tzdata

ENV TZ=Asia/Shanghai
ENV TORRENTLIST=https://cdn.jsdelivr.net/gh/ngosang/trackerslist@master/trackers_all.txt

ADD ./tracker-add.sh .
RUN apk add --update \
        bash curl coreutils jq && \
        chmod +x tracker-add.sh

USER guest
ENTRYPOINT [ "/bin/bash", "tracker-add.sh" ]
