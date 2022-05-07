ARG BASE_IMAGE="azul/zulu-openjdk:17-jre"

FROM $BASE_IMAGE

ARG CONFLUENT_PLATFORM_URL="http://packages.confluent.io/archive/7.1/confluent-community-7.1.1.tar.gz"

RUN apt-get update -y && apt-get install -y curl rsync

COPY --from=hairyhenderson/gomplate:stable /gomplate /bin/gomplate

RUN mkdir /confluent && \
    curl -f -o /tmp/confluent.tar.gz "$CONFLUENT_PLATFORM_URL" && \
    tar xzvf /tmp/confluent.tar.gz --strip-components=1 -C /confluent && \
    rm /tmp/confluent.tar.gz

ENV CONFLUENT_HOME=/confluent
ENV PATH="${CONFLUENT_HOME}/bin:${PATH}"
