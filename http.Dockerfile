FROM ubuntu:24.04

WORKDIR /aquatic/config

COPY bin/http/ /aquatic/

ENTRYPOINT ["/aquatic/aquatic_http"]

CMD ["-c", "aquatic-http-config.toml"]


