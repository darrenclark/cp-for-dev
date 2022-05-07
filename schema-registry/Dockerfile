ARG BASE_IMAGE="quay.io/darrenjoelclark/cp-for-dev-base:7.1.1"

FROM $BASE_IMAGE

WORKDIR /app

COPY run.sh schema-registry.properties.tmpl ./

EXPOSE 8081

CMD /app/run.sh
