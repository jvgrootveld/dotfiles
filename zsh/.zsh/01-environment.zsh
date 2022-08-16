# Set environment variables

# Paths
# export GOROOT=/usr/local/opt/go/libexec
# export GOPATH=$HOME/.go

export PATH="$PATH:/Users/jvgrootveld/.local/bin" # bins
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin # Golang
export PATH=$PATH:$(go env GOPATH)/bin # Golang installed bins
export PATH="$PATH:/Users/jvgrootveld/idea" # Idea

# Homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# NVM - Node version manager
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# JENV - Java JVM version manager
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Color
# export TERM="xterm-256color"

# Preferred text editor
export EDITOR=nvim
export VISUAL=nvim
bindkey -v            # Vi mode for keys. See http://zsh.sourceforge.net/Guide/zshguide04.html

# Language
# Check with command: locale
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LESSCHARSET=utf-8

# Init Zoxide
## Examples
## z foo       # cd to highest ranked directory matching foo
## z foo bar   # cd to highest ranked directory matching foo and bar
## z foo/      # can also cd into actual directories
## zi foo      # cd with interactive selection using fzf
## zq foo      # echo the best match, don't cd
## za /foo     # add /foo to the database
## zr /foo     # remove /foo from the database
eval "$(zoxide init zsh)"

# Temp help print for z till I know
Z_EXPLAIN="z is an alias for 'zoxide'. Run 'zoxide -h' for help"
Z_EXPLAIN+="z foo       # cd to highest ranked directory matching foo\n"
Z_EXPLAIN+="z foo bar   # cd to highest ranked directory matching foo and bar\n"
Z_EXPLAIN+="z foo/      # can also cd into actual directories\n"
Z_EXPLAIN+="zi foo      # cd with interactive selection using fzf\n"
Z_EXPLAIN+="zq foo      # echo the best match, dont cd\n"
Z_EXPLAIN+="zq -ls      # List all entries with its score.\n"
Z_EXPLAIN+="za /foo     # add /foo to the database\n"
Z_EXPLAIN+="zr /foo     # remove /foo from the database\n"
alias zz="printf '$Z_EXPLAIN'"
