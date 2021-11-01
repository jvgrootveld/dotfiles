# Guide for new machine

# Backup old machine's key items
```sh
sh backup-config.sh
```

# What is worth reinstalling?
```sh
brew leaves              > brew-list.txt    # all top-level brew installs
brew cask list           > cask-list.txt
```

Then compare brew-list to what's in `brew.sh`
```sh
comm <(sort brew-list.txt) <(sort brew.sh-cleaned-up)
```

# Manual check apps & tools
Check some apps for newer version

* openjdk@11
* Node

