#!/bin/bash

test -f /etc/default/hipchat_hg && . /etc/default/hipchat_hg

HIPCHAT_ROOM="HipChat room name or ID"

# path to target repo dir
PROJECT_DIR="/path/to/project"
# path to hipchat.sh from https://github.com/vkotovv/hg-hipchat-hook repo
HIPCHAT_SH_SCRIPT="/path/to/hipchat.sh"
. $HIPCHAT_SH_SCRIPT $PROJECT_DIR
