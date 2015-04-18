#!/usr/bin/env bash

shopt -s nullglob

WORKING_DIR="$(pwd)"

hash docker 2> /dev/null

if [ "${?}" -ne 0 ]; then
  echo "mumbledata: docker command not found."

  exit 1
fi

help() {
  cat << EOF
mumbledata: Usage: mumbledata <backup|restore|rm>
EOF

  exit 1
}

if [ "${1}" == "-h" ] || [ "${1}" == "--help" ]; then
  help
fi

unknown_command() {
  echo "mumbledata: Unknown command. See 'mumbledata --help'"

  exit 1
}

if [ -z "${1}" ]; then
  unknown_command
fi

mumbledata_containers() {
  echo "$(docker ps -a | grep mumbledata | awk '{ print $1 }')"
}

if [ "${1}" = "backup" ]; then
  CONTAINERS="$(mumbledata_containers)"

  if [ -n "${CONTAINERS}" ]; then
    for CONTAINER in ${CONTAINERS}; do
      CONTAINER_NAME="$(docker inspect --format='{{.Name}}' ${CONTAINER} | cut -c 2-)"

      docker run \
        --rm \
        --volumes-from "${CONTAINER}" \
        -v "${WORKING_DIR}:/backup" \
        viljaste/base:latest tar czvf "/backup/${CONTAINER_NAME}.tar.gz" /mumble
    done
  fi
elif [ "${1}" = "restore" ]; then
  for FILE in *.tar.gz; do
    CONTAINER="${FILE%%.*}"

    docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /mumble \
      viljaste/data:latest

    docker run \
      --rm \
      --volumes-from "${CONTAINER}" \
      -v "${WORKING_DIR}:/backup" \
      viljaste/base:latest tar xzvf "/backup/${CONTAINER}.tar.gz"
  done
elif [ "${1}" = "rm" ]; then
  CONTAINERS="$(mumbledata_containers)"

  if [ -n "${CONTAINERS}" ]; then
    docker rm -f ${CONTAINERS}
  fi
else
  unknown_command
fi
