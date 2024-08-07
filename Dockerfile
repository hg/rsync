FROM alpine:3.20

RUN apk add --no-cache rsync openssh-client

COPY add-host /usr/bin/
