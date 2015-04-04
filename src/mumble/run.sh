#!/usr/bin/env bash

puppet apply --modulepath=/src/mumble/run/modules /src/mumble/run/run.pp

/usr/bin/supervisord
