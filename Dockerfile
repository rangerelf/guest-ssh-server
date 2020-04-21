FROM alpine:latest
EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]

RUN apk add --no-cache openssh bash dumb-init

COPY entrypoint.sh /
