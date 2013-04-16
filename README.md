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
Go to the `.hg/hgrc` in a repository you want to setup the hooks for and add a `changegroup` hook based on `hipchat_changegroup.sh` and make sure it is executable:

```sh
#!/bin/sh

HIPCHAT_SCRIPT="/path/to/hipchat-cli"
HIPCHAT_ROOM="HipChat room name or ID"
HIPCHAT_TOKEN="1234567890"
HIPCHAT_FROM="HG"

. /path/to/hipchat.sh
```

And you're done!

## Additional integrations

For [Rhodecode](http://rhodecode.org), [Redmine](http://redmine.org), and [Trac](http://trac.edgewall.org/) integrations, edit the following configuration in the `hipchat_changegroup.sh` hook file:
```sh
RHODECODE="http://rhodecode.example.com"
REDMINE="http://redmine.example.com"
TRAC="https://trac.example.com/project"
```

## Contributors

Many thanks to the contributors:
* [Hatem Nassrat](https://github.com/pykler)
* [Ben Tsai](https://github.com/bentsai)
