FROM selenium/standalone-firefox-debug:2.53.0

ENV DEBIAN_FRONTEND noninteractive

#========================
# Miscellaneous packages
# Includes minimal runtime used for executing non GUI Java programs
#========================
RUN apt-get update -qqy \
  && apt-get -qqy  install \
    bzip2 \
    ca-certificates \
    openjdk-8-jre-headless \
    sudo \
    unzip \
    wget \
  && rm -rf /var/lib/apt/lists/* \
  && sed -i 's/securerandom\.source=file:\/dev\/random/securerandom\.source=file:\/dev\/urandom/' ./usr/lib/jvm/java-8-openjdk-amd64$

COPY perf.jar /home/perf.jar
COPY start.sh /home/docker-entrypoint.sh
RUN  ["chmod", "+x", "/home/docker-entrypoint.sh"]
CMD  /home/docker-entrypoint.sh
