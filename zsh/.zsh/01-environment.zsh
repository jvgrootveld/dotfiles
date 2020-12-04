# Set environment variables

# Paths
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go

export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH="$PATH:/Users/justinvangrootveld/idea" # Idea

# Color
export TERM="xterm-256color"

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
