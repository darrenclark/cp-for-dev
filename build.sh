#!/usr/bin/env bash

set -euo pipefail

export DOCKER_BUILDKIT=1

image_repo_prefix=${IMAGE_REPO_PREFIX?IMAGE_REPO_PREFIX must be set, see README}
image_tag=${IMAGE_TAG?IMAGE_TAG must be set, see README}
image_tag_latest=${IMAGE_TAG_LATEST:-false}
confluent_platform_url=${CONFLUENT_PLATFORM_URL?CONFLUENT_PLATFORM_URL must be set, see README}
output=${OUTPUT:-docker}
platforms=${PLATFORMS?PLATFORMS must be set, see README}

function docker_build() {
  name="$1"

  echo "Building $image_repo_prefix-$name:$image_tag"

  args=()

  if [[ "$output" == "docker" ]]; then
    args+=("--load")
  elif [[ "$output" == "registry" ]]; then
    args+=("--push")
    args+=("--platform" "$platforms")
  else
    echo "ERROR: expected OUTPUT to be 'docker' or 'registry', got '$output'"
    return 1;
  fi

  if [[ "$name" == "base" ]]; then
    args+=("--build-arg" "CONFLUENT_PLATFORM_URL=$CONFLUENT_PLATFORM_URL")
  else
    args+=("--build-arg" "BASE_IMAGE=${image_repo_prefix}-base:${image_tag}")
  fi

  args+=("-t" "$image_repo_prefix-$name:$image_tag")

  if [[ "$image_tag_latest" == "true" ]]; then
    args+=("-t" "$image_repo_prefix-$name:latest")
  fi

  docker buildx build "${args[@]}" ./$name
}

docker_build base
docker_build kafka
docker_build schema-registry

echo "Done!"
