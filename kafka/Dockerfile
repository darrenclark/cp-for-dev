ARG BASE_IMAGE="quay.io/darrenjoelclark/cp-for-dev-base:7.1.1"

FROM $BASE_IMAGE

WORKDIR /app

COPY run.sh log4j.properties.tmpl server.properties.tmpl ./

EXPOSE 9092
EXPOSE 9093

CMD /app/run.sh
