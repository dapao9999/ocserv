#
# Dockerfile for ocserv
#

FROM ubuntu

RUN apt update && apt install ocserv gnutls-bin iptables -y

COPY docker-entrypoint.sh /entrypoint.sh
COPY ocserv.conf /etc/ocserv/ocserv.conf

EXPOSE 443/tcp 443/udp

ENTRYPOINT ["/entrypoint.sh"]

CMD ["ocserv", "-c", "/etc/ocserv/ocserv.conf", "-f"]

