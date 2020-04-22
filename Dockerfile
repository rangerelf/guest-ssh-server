FROM alpine:latest
EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D", "-e"]

RUN apk add --no-cache openssh bash dumb-init
COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint.sh /
