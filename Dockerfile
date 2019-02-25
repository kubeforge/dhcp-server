FROM alpine

RUN ["apk", "update"]
RUN ["apk", "upgrade", "--available"]

RUN ["apk", "add", \
      "tcpdump"]

ADD dnsmasq.conf /opt/dnsmasq.conf

RUN apk --no-cache add dnsmasq

EXPOSE 67 67/udp

ENTRYPOINT dnsmasq -q -d \
  --conf-file=/opt/dnsmasq.conf \
  --interface=$interface \
  --dhcp-broadcast \
  --dhcp-range=10.8.$tenant_id.10,10.8.$tenant_id.250,255.255.255.0,5m \
  --dhcp-option=3,10.8.$tenant_id.1
