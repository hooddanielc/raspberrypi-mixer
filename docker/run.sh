#!/bin/bash -xe
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
docker run --rm \
  -e LOCAL_USER_ID=${UID} \
  -v $(dirname $DIR):/data/workspace \
  -ti raspberrypi4-builder /bin/bash
