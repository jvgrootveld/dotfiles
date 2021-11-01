# Justin's dotfiles


## Setup new system
The idea is to run `setup-a-new-machine.sh` and the script does everything for you including:
* Install applications with brew and brew cask
* Setup dotfiles for zsh, nvim, tmux and more
* Set my new system defaults (see `.osx`)

## Symlink everything using stow
The `stow` command creates symlinks for the content of the package (folder) in the parent of the present working directory.

Example
Current dir `~/dotfiles`
```
vim/
└── .config
    └── nvim
        ├── autoload
        │   └── plug.vim
        ├── config
        │   └── keys.vim
        └── init.vim
```

Run with verbose flag
```sh
stow -v vim
```

Results in creating symlinks
```
~/.config/nvim -> "~/dotfiles/vim/.config/nvim"
```


Handy command to know
```sh
# Dry run (don't change anything)
stow --no

# Delete links
stow -D ...

# Restow (recreate symlinks) with verbose output
stow -Rv ...
```

## Terminal Emulator
I use [Alacritty](https://github.com/alacritty/alacritty) as my main Terminal Emulator. See dotfiles for configuration.

## Shells
I use zsh as my main shell. I used to use [zprezto](https://github.com/sorin-ionescu/prezto) but migrated to an minimal own implementation because it didn't use like 90% of it.
Some configurations are inspired by zprezto though.

### Missing / Issues
Migration from zprezto findings to be resolved:
- Autocomplete git branches


## Explanations
For all unknown (and self-reference) a little explanation for every file included

`zsh` (Stow package)
Contains aliasses for frequently used functions

`git` (Stow package)


`other`
Directory with other misc stuff


## References
Some references where I got my dotfiles inspiration from.

* https://github.com/paulirish/dotfiles

# TODO
TODO for complete installation

* Set karabiner config to correct path
* How to encrypt personal data like `.ssh/config` ?
