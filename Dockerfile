FROM ubuntu:xenial

COPY quartus/QuartusLiteSetup-16.0.0.211-linux.run /QuartusLiteSetup-16.0.0.211-linux.run

ENV DEBIAN_FRONTEND noninteractive
ENV LICENSE Quartus-prime-megacore

RUN apt-get update
RUN apt-get -y -qq install apt-utils
RUN apt-get -y -qq install software-properties-common
RUN apt-get -y -qq install libglib2.0-0:amd64
RUN apt-get -y -qq install libpng12-0:amd64
RUN apt-get -y -qq install libfreetype6:amd64
RUN apt-get -y -qq install libsm6:amd64
RUN apt-get -y -qq install libxrender1:amd64
RUN apt-get -y -qq install libfontconfig1:amd64
RUN apt-get -y -qq install libxext6:amd64
RUN chmod 755 /QuartusLiteSetup-16.0.0.211-linux.run
RUN /QuartusLiteSetup-16.0.0.211-linux.run --mode unattended --unattendedmodeui none --installdir /opt/altera_lite


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
#COPY quartus/cyclonev-16.0.0.211.qdz /cyclonev-16.0.0.211.qdz
CMD /opt/altera_lite/quartus/bin/quartus
