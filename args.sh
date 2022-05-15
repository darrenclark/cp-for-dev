#!/usr/bin/env bash

export CONFLUENT_PLATFORM_URL=http://packages.confluent.io/archive/7.1/confluent-community-7.1.1.tar.gz

export IMAGE_REPO_PREFIX=cp-for-dev

export IMAGE_TAG=7.1.1

export IMAGE_TAG_LATEST=true

# docker - put image in local docker install
# registry - push image to registry
export OUTPUT=docker

# what platforms to build?  ignored when OUTPUT=registry
export PLATFORMS=linux/amd64,linux/arm64
