FROM ubuntu:24.04

WORKDIR /aquatic/config

COPY bin/udp/ /aquatic/

ENTRYPOINT ["/aquatic/aquatic_udp"]

CMD ["-c", "aquatic-udp-config.toml"]


