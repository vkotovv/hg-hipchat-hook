# Mercurial HipChat Hook

A simple Mercurial [changegroup](http://www.selenic.com/mercurial/hgrc.5.html#hooks) hook script for notifying a room in HipChat.
Based on [git-hipchat-hook](https://github.com/eirc/git-hipchat-hook) by *eirc*.

## Installation

Clone this repository somewhere in your Mercurial repository host server.

```sh
git clone git://github.com/vkotovv/hg-hipchat-hook.git
```

Clone [hipchat-cli](https://github.com/hipchat/hipchat-cli) somewhere in your Mercurial repository host server.

```sh
git clone git://github.com/hipchat/hipchat-cli.git
```
Create configuration file named `/etc/default/hipchat_hg`. It can be shared between all your repos with hooks:
```sh
HIPCHAT_SCRIPT="/path/to/hipchat-cli"
HIPCHAT_TOKEN="1234567890"
HIPCHAT_FROM="HG"

# REDMINE="http://redmine.example.com"
# RHODECODE="http://rhodecode.example.com"
# TRAC="https://trac.example.com/project"
# JIRA="http://jira.example.com"
```
Go to the `.hg/hgrc` in a repository you want to setup the hooks for and add a `changegroup` hook based on `hipchat_changegroup.sh` and make sure it is executable. You should fill project-specific options here:

```sh
HIPCHAT_ROOM="HipChat room name or ID"

# path to target repo dir
PROJECT_DIR="/path/to/project"
# path to hipchat.sh from https://github.com/vkotovv/hg-hipchat-hook repo
HIPCHAT_SH_SCRIPT="/path/to/hipchat.sh"
```

And you're done!

## Additional integrations

For [Rhodecode](http://rhodecode.org), [Redmine](http://redmine.org), [Trac](http://trac.edgewall.org/) and [JIRA](http://www.atlassian.com/software/jira/overview) integrations, edit the following configuration in the `/etc/default/hipchat_hg` config file:
```sh
RHODECODE="http://rhodecode.example.com"
REDMINE="http://redmine.example.com"
TRAC="https://trac.example.com/project"
JIRA="http://jira.example.com"
```

## Contributors

Many thanks to the contributors:
* [Hatem Nassrat](https://github.com/pykler)
* [Ben Tsai](https://github.com/bentsai)
