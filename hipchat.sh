#!/bin/bash

# Find out basic variables
HG_EXEC=`which hg`
REPO=`basename $PWD`
HIPCHAT_COLOR="yellow"

USER=`$HG_EXEC log -l 1 -r $HG_NODE --template="{author|person}"`

# Setup rhodecode, redmine and trac links
REPO_LINK=$REPO
TEMPLATE_PREFIX="- {desc}"
TEMPLATE_CHANGE="({node|short})"
TEMPLATE_BRANCH="[{branch}]"
if [ -n "$RHODECODE" ]
then
  REPO_LINK="<a href=\"$RHODECODE/$REPO/summary\">$REPO</a>"
  TEMPLATE_CHANGE="(<a href=\"$RHODECODE/$REPO/changeset/{node|short}\">{node|short}</a>)"
elif [ -n "$TRAC" ]
then
  REPO_LINK="<a href=\"$TRAC/browser/$REPO\">$REPO</a>"
  TEMPLATE_CHANGE="(<a href=\"$TRAC/changeset/{node|short}/$REPO\">{node|short}</a>)"
fi

# Construct message
TITLE="$USER pushed some changesets to $REPO_LINK:"
LOG=`$HG_EXEC log -r $HG_NODE:tip --template="$TEMPLATE_PREFIX $TEMPLATE_CHANGE $TEMPLATE_BRANCH\n"`

# manipulate redmine issue links if available
# TODO: the same for trac
if [ -n "$REDMINE" ]
then
  # Using ~ as a sed separator to prevent failing on http:// slashes (see http://ubuntuforums.org/showthread.php?t=1270429)
  LOG=`echo "$LOG" | sed "s~#\([0-9]*\)~<a href=\"$REDMINE\/issues\/\1\">#\1<\/a>~g"`
fi

MSG="$TITLE\n$LOG"

# Send it to HipChat
echo "$MSG" | $HIPCHAT_SCRIPT -n -c "$HIPCHAT_COLOR" -t "$HIPCHAT_TOKEN" -r "$HIPCHAT_ROOM" -f "$HIPCHAT_FROM" > /dev/null

