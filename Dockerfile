FROM ubuntu:xenial
MAINTAINER Maxim B. Belooussov <belooussov@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LICENSE Quartus-prime-megacore

# minimal number of layers
RUN apt-get update && \
    apt-get -y -qq install apt-utils \
                        software-properties-common \
                        libglib2.0-0:amd64 \
                        libpng12-0:amd64 \
                        libfreetype6:amd64 \
                        libsm6:amd64 \
                        libxrender1:amd64 \
                        libfontconfig1:amd64 \
                        libxext6:amd64 \
                        wget:amd64 && \
    wget --quiet http://10.0.0.1/quartus/QuartusLiteSetup-16.0.0.211-linux.run -O /QuartusLiteSetup-16.0.0.211-linux.run && \
    chmod 755 /QuartusLiteSetup-16.0.0.211-linux.run && \
    locale-gen en_US.UTF-8 && \
    /QuartusLiteSetup-16.0.0.211-linux.run --mode unattended --unattendedmodeui none --installdir /opt/altera_lite && \
    rm -f /QuartusLiteSetup-16.0.0.211-linux.run && \
    mkdir /workspace && \
    wget --quiet http://10.0.0.1/quartus/cyclonev-16.0.0.211.qdz -O /cyclonev-16.0.0.211.qdz

# Replace 501 / 20 with your user / group id
# RUN export uid=501 gid=20 && \
#     mkdir -p /home/developer && \
#     echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
#     echo "developer:x:${uid}:" >> /etc/group && \
#     echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
#     mkdir /etc/sudoers.d/developer &&\
#     chmod 0440 /etc/sudoers.d/developer && \
#     chown ${uid}:${gid} -R /home/developer

# USER developer
# ENV HOME /home/developer
# WORKDIR /home/developer
CMD /opt/altera_lite/quartus/bin/quartus
