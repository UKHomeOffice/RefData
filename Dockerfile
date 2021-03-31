FROM quay.io/ukhomeofficedigital/csv_loader:latest

COPY flyway/conf /flyway/conf
COPY flyway/schemas /flyway/schemas

USER root
RUN chown -R java:java /flyway

USER java
ENTRYPOINT ["/flyway/run.sh"]
WORKDIR /
