#!/bin/bash

AGENT_ROOT=/opt/codedeploy-agent

COMMAND="${AGENT_ROOT}/deployment-root/${DEPLOYMENT_GROUP_ID}/${DEPLOYMENT_ID}/deployment-archive/deploy/hook-scripts/${DEPLOYMENT_GROUP_NAME}/${LIFECYCLE_EVENT}.sh"

LOG_LABEL="[${APPLICATION_NAME}:${DEPLOYMENT_GROUP_NAME}:${LIFECYCLE_EVENT}]"

if [[ -f $COMMAND ]]; then
    {
      echo "Execution started" | ts "[%Y-%m-%d %H:%M:%S%z] ${LOG_LABEL}"
      source "$COMMAND" | ts "[%Y-%m-%d %H:%M:%S%z] ${LOG_LABEL}"
      echo "Execution ended" | ts "[%Y-%m-%d %H:%M:%S%z] ${LOG_LABEL}"
    } >> "${HOME}/logs/deploy.log" 2>&1
fi
