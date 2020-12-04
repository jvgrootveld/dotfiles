#!/bin/bash

# Install command-line tools using Homebrew

brew update # Make sure we’re using the latest Homebrew
brew upgrade # Upgrade any already-installed formulae

# Required taps
# -----------------------------------------------
brew tap homebrew/dupes


# Install more recent versions of some OS X tools
# Note: "--with-default-names" demoves the prefix so it overwite the default one
# -----------------------------------------------

brew install coreutils                      # GNU core utilities (those that come with OS X are outdated)
brew install findutils --with-default-names # GNU `find`, `locate`, `updatedb`, and `xargs`
brew install gnu-sed --with-default-names   # GNU `sed`, overwriting the built-in `sed`
brew install vim --with-override-system-vi
brew install openssh
brew install gawk
brew install gnu-tar --with-default-names
brew install gnu-which --with-default-names
brew install grep --with-default-names
brew install gzip
brew install watch
brew install wget


# Install apps & tools
# -----------------------------------------------

brew install tmux                # Terminal multiplexer
brew install zoxide              # z hopping around folders
brew install entr                # run this script when this file changes guy
brew install ack                 # Ack is a search tool that is optimized for working on source files
brew install the_silver_searcher # `ag` A code searching tool similar to ack, with a focus on speed
brew install fzf                 # General-purpose command-line fuzzy finder
brew install git                 # Best version- control system ever, ty Linus!
brew install node                # Node. This installs `npm` too using the recommended installation method
brew install pv                  # Monitor the progress of data through a pipe
brew install rename              # Rename multiple files
brew install tree                # List contents of directories in a tree-like format
brew install terminal-notifier   # Command-line tool to send macOS User Notifications
brew install zsh                 # ZSH shell
brew install neovim              # Vim refactor
brew install maven@3.3           # Maven Version 3.3.x
brew install stow                # Symlink farm manager
brew install tree                # Terminal tree viewer

# After installs
# -----------------------------------------------

brew cleanup # Remove outdated versions from the cellar

# TO CHECK / CURRENTLY INSTALLED
# ------------------------------------
#bash-git-prompt # https://github.com/magicmonty/bash-git-prompt
#erlang@19
#fswatch
#gettext
#gradle
#icu4c
#jq
#libpng
#libuv
#lua
#maven@3.3
#node@8
#pandoc
#pkg-config
#python@2
#readline
#sqlite
#unibilium
#wxmac
#autoconf
#bat
#erlang@20
#highlight
#jemalloc
#kubernetes-cli
#libtermkey
#libvterm
#luajit
#mr
#nmap
#oniguruma
#pcre2
#pstree
#rabbitmq
#ruby
#tldr
#unrar
#xz
#bash-completion
#erlang
#fish
#gdbm
#go
#hugo
#jpeg
#libevent
#libtiff
#libyaml
#maven
#msgpack
#nnn
#openssl
#perl
#python
#rbenv
#ruby-build
#yarn
