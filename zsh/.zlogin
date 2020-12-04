# Load order:
#  01. /etc/zshenv
#  02. ~/.zshenv
#  03. /etc/zprofile
#  04. ~/.zprofile
#  05. /etc/zshrc
#  06. ~/.zshrc
#  07. /etc/zlogin
#  08. ~/.zlogin      <----- This file
#  09. ~/.zlogout
#  10. /etc/zlogout

# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

