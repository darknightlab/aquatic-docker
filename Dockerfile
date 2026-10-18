# Builds one aquatic tracker (ws | udp | http) from the latest upstream source.
#   docker build --build-arg CRATE=ws -t darknightlab/aquatic-ws .
FROM rust:1-bookworm AS build
ARG AQUATIC_REF=master
ARG CRATE=ws
RUN apt-get update && apt-get install -y --no-install-recommends cmake build-essential git && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/greatest-ape/aquatic /src && cd /src && git checkout "$AQUATIC_REF" && git rev-parse HEAD > /aquatic-commit
WORKDIR /src
RUN cargo build --release -p aquatic_${CRATE} && cp target/release/aquatic_${CRATE} /aquatic-bin

FROM debian:bookworm-slim
ARG CRATE=ws
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && rm -rf /var/lib/apt/lists/*
COPY --from=build /aquatic-bin /usr/local/bin/aquatic
COPY --from=build /aquatic-commit /aquatic-commit
# config file is mounted at /aquatic/config/aquatic-<crate>-config.toml
WORKDIR /aquatic/config
ENV CRATE=${CRATE}
ENTRYPOINT ["/bin/sh", "-c", "exec /usr/local/bin/aquatic -c aquatic-${CRATE}-config.toml \"$@\"", "--"]
