FROM ubuntu:24.04

WORKDIR /aquatic/config

COPY bin/ws/ /aquatic/

ENTRYPOINT ["/aquatic/aquatic_ws"]

CMD ["-c", "aquatic-ws-config.toml"]


