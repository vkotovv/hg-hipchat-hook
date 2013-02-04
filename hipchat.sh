#!/bin/bash

# Find out basic variables
HG_EXEC=`which hg`
REPO=`basename $PWD`
HIPCHAT_COLOR="yellow"

USER=`$HG_EXEC log -l 1 -r $HG_NODE --template="{author|person}"`

# Setup rhodecode links
if [ -n "$RHODECODE" ]
then
  REPO_LINK="<a href=\"http://$RHODECODE/$REPO/summary\">$REPO</a>"
else
  REPO_LINK=$REPO
fi

# Construct message
TITLE="$USER pushed some changesets to $REPO_LINK:"
if [ -n "$RHODECODE" ]
  then
LOG=`$HG_EXEC log -r $HG_NODE:tip --template="- {desc} (<a href=\"http://$RHODECODE/$REPO/changeset/{node|short}\">{node|short}</a>) [{branch}]\n"`
  else
LOG=`$HG_EXEC log -r $HG_NODE:tip --template="- {desc} ({node|short}) [{branch}]\n"`
fi

if [ -n "$REDMINE" ]
  then
LOG=`echo "$LOG" | sed "s/#\([0-9]*\)/#<a href=\"http:\/\/$REDMINE\/issues\/\1\">\1<\/a>/g"`
fi

MSG="$TITLE\n$LOG"

# Send it to HipChat
echo "$MSG" | $HIPCHAT_SCRIPT -n -c "$HIPCHAT_COLOR" -t "$HIPCHAT_TOKEN" -r "$HIPCHAT_ROOM" -f "$HIPCHAT_FROM" > /dev/null

