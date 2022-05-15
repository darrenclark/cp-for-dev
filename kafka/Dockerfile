ARG BASE_IMAGE

FROM $BASE_IMAGE

WORKDIR /app

COPY run.sh log4j.properties.tmpl server.properties.tmpl ./

EXPOSE 9092
EXPOSE 9093

CMD /app/run.sh
