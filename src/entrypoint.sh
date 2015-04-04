#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/mumble/build.sh && /src/mumble/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/mumble/variables.sh && /src/mumble/run.sh"
    ;;
esac
