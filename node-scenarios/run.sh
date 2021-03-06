#!/bin/bash

set -ex

# Source env.sh to read all the vars
source /root/main_env.sh
source /root/env.sh

source /root/common_run.sh
checks

# Substitute config with environment vars defined
envsubst < /root/kraken/scenarios/node_scenario.yaml.template > /root/kraken/scenarios/node_scenario.yaml
envsubst < /root/kraken/config/config.yaml.template > /root/kraken/config/node_scenario_config.yaml

# Run Kraken
cd /root/kraken

cat config/node_scenario_config.yaml

cat scenarios/node_scenario.yaml

python3 run_kraken.py --config=config/node_scenario_config.yaml
