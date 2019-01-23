# Laptop

Laptop is a script to set up an macOS laptop for web and mobile development.

It can be run multiple times on the same machine safely.
It installs, upgrades, or skips packages
based on what is already installed on the machine.

## Requirements

We support:

- macOS High Sierra (10.13)
- macOS Mojave (10.14)

Older versions may work but aren't regularly tested.
Bug reports for older versions are welcome.

## Install

Download the script:

```sh
wget https://github.com/danielriley06/laptop/archive/master.zip -P ~ && unzip -a ~/master.zip && rm -rf ~/master.zip && cd laptop-master
```

Review the script (avoid running scripts you haven't read!):

```sh
less setup
```

Execute the downloaded script:

```bash
bash setup 2>&1 | tee ~/setup.log
```

Optionally, review the log:

```sh
less ~/setup.log
```

## Debugging

Your last Laptop run will be saved to `~/laptop.log`.
Read through it to see if you can debug the issue yourself.
If not, copy the lines where the script failed into a
[new GitHub Issue](https://github.com/thoughtbot/laptop/issues/new) for us.
Or, attach the whole log file as an attachment.

## What it sets up

macOS tools:

- [Homebrew] for managing operating system libraries.
- [iTerm2] as a replacement for Terminal and the successor to iTerm.
- [vs-code] a source code editor developed by Microsoft for Windows, Linux and macOS.

[homebrew]: http://brew.sh/
[iterm2]: https://www.iterm2.com/

Unix tools:

- [Exuberant Ctags] for indexing files for vim tab completion
- [Git] for version control
- [OpenSSL] for Transport Layer Security (TLS)
- [RCM] for managing company and personal dotfiles
- [The Silver Searcher] for finding things in files
- [Tmux] for saving project state and switching between projects
- [Watchman] for watching for filesystem events
- [Zsh] as your shell
- [oh-my-zsh] an open source, community-driven framework for managing your zsh configuration.

[exuberant ctags]: http://ctags.sourceforge.net/
[git]: https://git-scm.com/
[openssl]: https://www.openssl.org/
[rcm]: https://github.com/thoughtbot/rcm
[the silver searcher]: https://github.com/ggreer/the_silver_searcher
[tmux]: http://tmux.github.io/
[watchman]: https://facebook.github.io/watchman/
[zsh]: http://www.zsh.org/
[oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh

Heroku tools:

- [Heroku CLI] and [Parity] for interacting with the Heroku API

[heroku cli]: https://devcenter.heroku.com/articles/heroku-cli
[parity]: https://github.com/thoughtbot/parity

GitHub tools:

- [Hub] for interacting with the GitHub API

[hub]: http://hub.github.com/

Image tools:

- [ImageMagick] for cropping and resizing images

Programming languages, package managers, and configuration:

- [ASDF] for managing programming language versions
- [Bundler] for managing Ruby libraries
- [Node.js] and [NPM], for running apps and installing JavaScript packages
- [Ruby] stable for writing general-purpose code
- [Yarn] for managing JavaScript packages

[bundler]: http://bundler.io/
[imagemagick]: http://www.imagemagick.org/
[node.js]: http://nodejs.org/
[npm]: https://www.npmjs.org/
[asdf]: https://github.com/asdf-vm/asdf
[ruby]: https://www.ruby-lang.org/en/
[yarn]: https://yarnpkg.com/en/

Databases:

- [Postgres] for storing relational data
- [Redis] for storing key-value data

[postgres]: http://www.postgresql.org/
[redis]: http://redis.io/

It should take less than 15 minutes to install (depends on your machine).

## License

Laptop is © 2018-2019 Dan Riley
It is free software,
and may be redistributed under the terms specified in the [LICENSE] file.

[MIT license](LICENSE.txt).
