# Aliasses

# Directory
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias l='ls -G1A'         # Lists in one column, hidden files.
alias ll='ls -Glh'        # Lists human readable sizes.
alias lr='ll -GR'         # Lists human readable sizes, recursively.
alias la='ll -GA'         # Lists human readable sizes, hidden files.

# Lists the ten most used commands.
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

# Git
alias g='git'
alias fetch="git fetch"
alias pull="git pull"

# Docker
alias dk='docker'
alias dkc='docker-compose'

# Kubernetes
alias k='kubectl'
alias kg='kubectl get'
alias kgpo='kubectl get pod'
alias kd='kubectl describe'

# Java version switch
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
#export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_13_HOME=$(/usr/libexec/java_home -v13)

# Define aliases for easy java version switching
alias java8='export JAVA_HOME=$JAVA_8_HOME'
#alias java11='export JAVA_HOME=$JAVA_11_HOME'
alias java13='export JAVA_HOME=$JAVA_13_HOME'

# Default java13
java13
