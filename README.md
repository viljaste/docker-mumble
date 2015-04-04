# docker-mumble

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mumble.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t viljaste/mumble:latest . \
      && cd -

## License

**MIT**
