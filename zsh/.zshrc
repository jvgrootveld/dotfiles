# Load order:
#  01. /etc/zshenv
#  02. ~/.zshenv
#  03. /etc/zprofile
#  04. ~/.zprofile
#  05. /etc/zshrc
#  06. ~/.zshrc        <----- This file
#  07. /etc/zlogin
#  08. ~/.zlogin
#  09. ~/.zlogout
#  10. /etc/zlogout

# Load configs
for config (~/.zsh/*.zsh) source $config

# Load private configs
for config (~/.zsh_private/*.zsh) source $config

# zsh-history-substring-search 
# Search history with `CTRL + p`
# https://github.com/zsh-users/zsh-history-substring-search
source ~/.zsh/external/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=magenta,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'
# Key bindinds
bindkey '^R' history-incremental-search-backward
bindkey -M vicmd "k" history-substring-search-up
bindkey -M vicmd "j" history-substring-search-down

# zsh-autosuggestions.zsh
# https://github.com/zsh-users/zsh-autosuggestions
source ~/.zsh/external/zsh-autosuggestions/zsh-autosuggestions.zsh
## See https://github.com/zsh-users/zsh-autosuggestions#suggestion-highlight-style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=28"

# bun completions
[ -s "~/.bun/_bun" ] && source "~/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/jvangrootveld/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
