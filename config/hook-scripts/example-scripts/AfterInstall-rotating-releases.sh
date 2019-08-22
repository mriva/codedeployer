#!/bin/bash

##########################################
# WARNING: THIS SCRIPT IS WIP DO NOT USE #
##########################################

# Build archive path from AWS Codedeploy environment variables
# The source is the temporary folder where Codedeploy stores the uncompressed archive of the current revision
ARCHIVE_DIR="/opt/codedeploy-agent/deployment-root/${DEPLOYMENT_GROUP_ID}/${DEPLOYMENT_ID}/deployment-archive"

# Create the directory for the new release
TARGET_DEPLOY_DIR=

DEPLOY_SCRIPTS_DIR=$(dirname $0)
REVISION=$(cat "${DEPLOY_SCRIPTS_DIR}/../deployed_revision")

NEW_REVISION_DIRECTORY="${TARGET_DEPLOY_DIR}/${REVISION}"
mkdir -p "${NEW_REVISION_DIRECTORY}"

# Copy files to the new directory
rsync -a "${ARCHIVE_DIR}/" "${NEW_REVISION_DIRECTORY}"

# Shared things

# Execute application scripts

# Switch current release

# Delete old releases
(cd ${TARGET_DEPLOY_DIR} && /bin/ls -1 | head -n -5 | xargs rm -rf)

#echo Done.