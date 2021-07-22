#!/usr/bin/env bash

set -e

docker cp devops/config/kind/install.sh kind-control-plane:/install.sh
docker exec -it kind-control-plane /install.sh

docker cp devops/config/kind/install.sh kind-worker:/install.sh
docker exec -it kind-worker /install.sh

docker cp devops/config/kind/install.sh kind-worker2:/install.sh
docker exec -it kind-worker2 /install.sh

docker cp devops/config/kind/install.sh kind-worker3:/install.sh
docker exec -it kind-worker3 /install.sh
