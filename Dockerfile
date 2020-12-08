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
COPY python /python
ADD create_ssh_key.sh /usr/bin/create_ssh_key.sh

RUN apt update \
    && apt upgrade -y \
    && apt install -y openssl ca-certificates bash curl postgresql-client git gettext gnupg python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install yasha colorclass terminaltables setuptools wheel \
    && apt remove -v python-pip3 \
    && apt autoremove -y \
    && apt clean \
    && mkdir -p /home/java/.ssh /root/.ssh \
    && chown -R java:java /home/java /docker /flyway /schemas \
    && chmod 600 /home/java/.ssh /root/.ssh \
    && chmod +x /usr/bin/create_ssh_key.sh

ENV PATH="/app:${PATH}"
ENV PYTHONPATH="/python:${PYTHONPATH}"

USER java
ENTRYPOINT ["flyway"]
WORKDIR /docker/
CMD ["-?"]
