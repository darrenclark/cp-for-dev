ARG BASE_IMAGE

FROM $BASE_IMAGE

WORKDIR /app

COPY run.sh schema-registry.properties.tmpl ./

EXPOSE 8081

CMD /app/run.sh
