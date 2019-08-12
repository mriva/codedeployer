#!/bin/bash

AGENT_ROOT=/opt/codedeploy-agent

COMMAND="${AGENT_ROOT}/deployment-root/${DEPLOYMENT_GROUP_ID}/${DEPLOYMENT_ID}/deployment-archive/deploy/hook-scripts/${DEPLOYMENT_GROUP_NAME}/${LIFECYCLE_EVENT}.sh"

echo "[${APPLICATION_NAME}:${DEPLOYMENT_GROUP_NAME}:${LIFECYCLE_EVENT}] Execution started" | ts '[%Y-%m-%d %H:%M:%S%z]' >> ${HOME}/logs/deploy.log

if [[ -f $COMMAND ]]; then
    source $COMMAND | ts '[%Y-%m-%d %H:%M:%S%z]' >> ${HOME}/logs/deploy.log 2>&1
fi

echo "[${APPLICATION_NAME}:${DEPLOYMENT_GROUP_NAME}:${LIFECYCLE_EVENT}] Execution ended" | ts '[%Y-%m-%d %H:%M:%S%z]' >> ${HOME}/logs/deploy.log