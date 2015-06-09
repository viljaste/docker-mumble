#!/usr/bin/env bash

puppet apply --modulepath=/src/mumble/run/modules /src/mumble/run/run.pp

supervisord -c /etc/supervisor/supervisord.conf
