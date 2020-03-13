#!/bin/bash

docker pull
cp nsx_pipeline_config.yml /home/concourse/
docker exec -it $(docker inspect nsx-t-install | jq -r .[0].Id) bash -c "fly -t nsx-concourse set-pipeline -p nsx-t-install -c /home/workspace/nsx-t-datacenter-ci-pipelines/pipelines/nsx-t-install.yml -l /home/concourse/pipeline_config_internal.yml -l /home/concourse/nsx_pipeline_config.yml"

