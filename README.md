# Mercurial HipChat Hook

A simple Mercurial `changegroup` hook script for notifying a room in HipChat.
Based on [git-hipchat-hook](https://github.com/eirc/git-hipchat-hook) by *eirc*.

## Installation

Clone this repository somewhere in your GIT repository host server.

```sh
hg clone git://github.com/vkotovv/hg-hipchat-hook.git
```

Clone [hipchat-cli](https://github.com/hipchat/hipchat-cli) somewhere in your Mercurial repository host server.

```sh
git clone git://github.com/hipchat/hipchat-cli.git
```
Go to the `.hg/hgrc` in a repository you want to setup the hooks for and add a `changegroup` hook based on `hipchat_changegroup.sh` and make sure it is executable:

```sh
#!/bin/sh

HIPCHAT_SCRIPT="/path/to/hipchat-cli"
HIPCHAT_ROOM="HipChat room name"
HIPCHAT_TOKEN="1234567890"
HIPCHAT_FROM="HG"

. /path/to/hipchat.sh
```

And you're done!

## Additional integrations

For [Rhodecode](http://rhodecode.org) and [Redmine](http://redmine.org) integrations, add the following configuration to the `hipchat_changegroup.sh` hook file:
```sh
RHODECODE="rhodecode.example.com"
REDMINE="redmine.example.com"
```
