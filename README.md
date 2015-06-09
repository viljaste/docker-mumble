# docker-mumble

## Build the image

    TMP="$(mktemp -d)" \
      && git GIT_SSL_NO_VERIFY=true git clone https://git.beyondcloud.io/viljaste/docker-mumble.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t viljaste/mumble:latest . \
      && cd -

## License

**MIT**
