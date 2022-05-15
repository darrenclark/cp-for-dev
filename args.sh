#!/usr/bin/env bash

# URL to download Confluent Platform. See this page for the latest URL:
#   https://docs.confluent.io/platform/current/installation/installing_cp/zip-tar.html
export CONFLUENT_PLATFORM_URL=http://packages.confluent.io/archive/7.1/confluent-community-7.1.1.tar.gz

# Prefix for the '-base', '-kafka' and '-schema-registry' images that will be built.
export IMAGE_REPO_PREFIX=cp-for-dev

# Docker image tag.
export IMAGE_TAG=7.1.1

# If set to 'true', also tags the images as 'latest'
export IMAGE_TAG_LATEST=true

# docker - put image in local docker install
# registry - push image to registry
export OUTPUT=docker

# what platforms to build?  ignored when OUTPUT=registry
export PLATFORMS=linux/amd64,linux/arm64
