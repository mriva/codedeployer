#!/bin/bash

# Build archive path from AWS Codedeploy environment variables
# The source is the temporary folder where Codedeploy stores the uncompressed archive of the current revision
ARCHIVE_DIR="/opt/codedeploy-agent/deployment-root/${DEPLOYMENT_GROUP_ID}/${DEPLOYMENT_ID}/deployment-archive"

# Add real destination directory and uncomment next line
#rsync -a "${ARCHIVE_DIR}" DESTINATION_DIRECTORY