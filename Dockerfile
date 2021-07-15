FROM debian:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y -qq install x11-apps
RUN useradd -ms /bin/bash mabe
USER mabe
CMD ["/bin/sh", "-c", "$0 \"$@\"", "xeyes"]
