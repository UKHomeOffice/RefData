FROM quay.io/ukhomeofficedigital/csv_loader:latest

COPY flyway/conf /flyway/conf
COPY flyway/schemas /flyway/schemas

RUN chown -R java:java /home/java /docker /flyway /schemas

ENTRYPOINT ["/flyway/run.sh"]
WORKDIR /
