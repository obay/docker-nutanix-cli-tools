#!/bin/bash

docker run -it --rm --env-file credentials/NutanixCluster obaycloud/docker-nutanix-cli-tools:latest ncli
docker run -it --rm --env-file credentials/NutanixCluster obaycloud/docker-nutanix-cli-tools:latest ncli