FROM digitalpatterns/jre:latest

# Add the flyway user and step in the directory
WORKDIR /flyway

ENV FLYWAY_VERSION 7.3.0

RUN mkdir -p /flyway \
  && curl -L https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}.tar.gz -o flyway-commandline-${FLYWAY_VERSION}.tar.gz \
  && tar -xzf flyway-commandline-${FLYWAY_VERSION}.tar.gz --strip-components=1 \
  && rm flyway-commandline-${FLYWAY_VERSION}.tar.gz

COPY docker /docker
COPY schemas /schemas

RUN apt update \
    && apt upgrade -y \
    && apt install -y openssl ca-certificates bash postgresql-client\
    && rm -rf /var/lib/apt/lists/* \
    && apt autoremove -y \
    && apt clean \
    && chown -R java:java /home/java /docker /flyway /schemas

ENV PATH="/flyway:/app:${PATH}"
ENV PYTHONPATH="/python:${PYTHONPATH}"

USER java
ENTRYPOINT ["/docker/run.sh"]
WORKDIR /docker/
