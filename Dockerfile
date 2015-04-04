FROM viljaste/base:latest

MAINTAINER Jürgen Viljaste <j.viljaste@gmail.com>

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

ADD ./src /src

RUN /src/entrypoint.sh build

VOLUME ["/mumble"]

EXPOSE 64738

CMD ["/src/entrypoint.sh", "run"]
