# aquatic-docker

Docker images of [aquatic](https://github.com/greatest-ape/aquatic) trackers, built from the latest upstream source by GitHub Actions (`.github/workflows/build.yml`):

- `darknightlab/aquatic-ws` / `ghcr.io/darknightlab/aquatic-ws` — WebTorrent (needs io_uring: run with `seccomp=unconfined` under podman/docker, and an unlimited `memlock` ulimit)
- `darknightlab/aquatic-udp`, `darknightlab/aquatic-http`

The config file is read from `/aquatic/config/aquatic-<crate>-config.toml` (mount a directory there; see `config/`).
Rebuild with another upstream ref: Actions → build → Run workflow → `aquatic_ref`.
