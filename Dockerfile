FROM ubuntu:latest
MAINTAINER Maxim B. Belooussov <belooussov@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LICENSE Quartus-prime-megacore

# minimal number of layers
RUN apt-get update && \
    apt-get -y -qq install apt-utils && \
    apt-get -y -qq install software-properties-common \
                           libglib2.0-0:amd64 \
                           libpng12-0:amd64 \
                           libfreetype6:amd64 \
                           libsm6:amd64 \
                           libxrender1:amd64 \
                           libfontconfig1:amd64 \
                           libxext6:amd64 \
                           xterm:amd64 && \
    locale-gen en_US.UTF-8 && \
    cp /download/QuartusLiteSetup-16.0.0.211-linux.run /QuartusLiteSetup-16.0.0.211-linux.run && \
    cp /download/cyclonev-16.0.0.211.qdz /cyclonev-16.0.0.211.qdz && \
    chmod 755 /QuartusLiteSetup-16.0.0.211-linux.run && \
    /QuartusLiteSetup-16.0.0.211-linux.run --mode unattended --unattendedmodeui none --installdir /opt/altera_lite && \
    rm -f /QuartusLiteSetup-16.0.0.211-linux.run && \
    rm -f /cyclonev-16.0.0.211.qdz

# Start the Quartus application in an xterm
CMD xterm -e "/opt/altera_lite/quartus/bin/quartus;bash"
