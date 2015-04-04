#!/usr/bin/env bash

if [ -z "${SUPW}" ]; then
  SUPW="SuperUser"
fi

export FACTER_SUPW="${SUPW}"

export FACTER_SERVERPASSWORD="${SERVERPASSWORD}"

if [ -z "${USERS}" ]; then
  USERS="100"
fi

export FACTER_USERS="${USERS}"
