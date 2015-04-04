#!/usr/bin/env bash

export FACTER_SERVERPASSWORD="${SERVERPASSWORD}"

if [ -z "${USERS}" ]; then
  USERS="100"
fi

export FACTER_USERS="${USERS}"
