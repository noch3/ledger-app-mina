#!/usr/bin/env bash

DOCKER_ID_FILE=.docker-env-id

if [ ! -f "$DOCKER_ID_FILE" ]; then
  docker build . --iidfile "$DOCKER_ID_FILE"
fi

docker run -v "$(pwd):/build" --rm "$(cat "$DOCKER_ID_FILE")" bash -c "source prepare-devenv.sh s && DEBUG=1 NO_EMULATOR=1 make $*"
