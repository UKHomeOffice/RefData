FROM quay.io/ukhomeofficedigital/csv_loader:latest


USER root
RUN rm -rf /flyway/conf/* /flyway/schemas/*

COPY flyway/conf /flyway/conf
COPY flyway/schemas /flyway/schemas


RUN chown -R java:java /flyway

USER java
ENTRYPOINT ["/flyway/run.sh"]
WORKDIR /
