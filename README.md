## Introduction

This image provides an easy way to add a postgres database
configuration for synapse. It uses the [matrix synapse docker
image](https://github.com/matrix-org/synapse/) as a base and adds
checking for the following variables:

* `SYNAPSE_CONFIG_DIR`: where to generate the postgres-db.yaml
* `POSTGRES_USER`: the postgres user
* `POSTGRES_PASSWORD`: the postgres password
* `POSTGRES_DB`: the postgres database
* `POSTGRES_HOST`: the postgres host

## How to use it from docker

```
docker run \
    -e SYNAPSE_CONFIG_DIR=/config \
    -e POSTGRES_USER=matrix-synapse \
    -e POSTGRES_PASSWORD=reallyreallysecure \
    -e POSTGRES_DB=matrix-synapse \
    -e POSTGRES_HOST=postgres-container
```

All arguments specified on
the
[matrixdotorg/synapse](https://hub.docker.com/r/matrixdotorg/synapse)
are also valid/passed through.
