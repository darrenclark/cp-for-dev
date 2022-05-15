# cp-for-dev

*"Confluent Platform for (local) development"*

Run Kafka and Confluent Schema Registry in Docker for local development.

## Details

- Built off [Confluent Platform's Community Features](https://docs.confluent.io/platform/current/platform.html#community-features)

- Supports `amd64` AND `arm64`, so runs smoothly on Intel and Apple Silicon Macs.

- No Zookeeper!  Uses [KRaft](https://developer.confluent.io/learn/kraft/)

- Only suited for local development, not safe for production!

## Running

Simply clone the repo and use `docker compose`.

```sh
git clone https://github.com/darrenclark/cp-for-dev
cd cp-for-dev
docker compose up -d
```

This gets:

- Kafka running on port `9092` (no authentication)
- Schema Registry running on port `8081` (no authentication)

This uses pre-built images from here:

- https://github.com/users/darrenclark/packages/container/package/cp-for-dev-kafka
- https://github.com/users/darrenclark/packages/container/package/cp-for-dev-schema-registry

## Building

- `args.sh` contains all the environment variables that should be set
- `build.sh` does the build (and possibly push)

### For local use

```sh
# switch to the default docker buildx builder
docker buildx use default

source ./args.sh

# use export=XYZ=... to override any arguments

./build.sh
```

### Pushing to a registry

```sh
# switch to a builder that can build and push multi-platform images
docker buildx create --use

source ./args.sh

# prefix for the -base, -kafka, -schema-registry suffixed image repositories
export IMAGE_REPO_PREFIX=your-registry.io/your-username/cp-for-dev
export OUTPUT=registry

# use export=XYZ=... to override any more arguments

./build.sh
```
