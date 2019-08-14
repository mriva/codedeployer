#!/bin/bash

# Build archive path from AWS Codedeploy environment variables
# The source is the temporary folder where Codedeploy stores the uncompressed archive of the current revision
ARCHIVE_DIR="/opt/codedeploy-agent/deployment-root/${DEPLOYMENT_GROUP_ID}/${DEPLOYMENT_ID}/deployment-archive"

### CREATE NEW RELEASE DIRECTORY

### COPY TO NEW RELEASE DIRECTORY

### RUN APP COMMANDS IN NEW RELEASE DIRECTORY

### SYMLINK CURRENT TO NEW RELEASE

### DELETE OLD RELEASES