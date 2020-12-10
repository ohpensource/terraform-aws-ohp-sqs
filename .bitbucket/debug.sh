#!/bin/bash

IMAGE="xops-awscli:latest"
LOCAL_REPO="/Users/rupertbroad/code/terraform/xops-tfm-mods/terraform-aws-chatops"
WORK_DIR="/localrepo"


docker run -it --volume=$LOCAL_REPO:$WORK_DIR --workdir=$WORK_DIR --entrypoint=/bin/bash $IMAGE

# --volume=/Users/myUserName/code/localDebugRepo:/localDebugRepo 