FROM ubuntu:xenial
MAINTAINER Maxim B. Belooussov <belooussov@gmail.com>

COPY quartus/QuartusLiteSetup-16.0.0.218-linux.run /QuartusLiteSetup-16.0.0.218-linux.run
COPY quartus/cyclonev-16.0.0.211.qdz /cyclonev-16.0.0.211.qdz

ENV LICENSE Quartus-prime-megacore

RUN mkdir -p /workspace && \
    apt-get update && \
    apt-get -y -qq install apt-utils && \
    apt-get -y -qq install software-properties-common && \
    apt-get -y -qq install libglib2.0-0:amd64 && \
    apt-get -y -qq install libpng12-0:amd64 && \
    apt-get -y -qq install libfreetype6:amd64 && \
    apt-get -y -qq install libsm6:amd64 && \
    apt-get -y -qq install libxrender1:amd64 && \
    apt-get -y -qq install libfontconfig1:amd64 && \
    apt-get -y -qq install libxext6:amd64 && \
    chmod 755 /QuartusLiteSetup-16.0.0.211-linux.run && \
    /QuartusLiteSetup-16.0.0.211-linux.run --mode unattended --unattendedmodeui none --installdir /opt/altera_lite && \
    rm -f /QuartusLiteSetup-16.0.0.211-linux.run

VOLUME /workspace
 
CMD /opt/altera_lite/quartus/bin/quartus
