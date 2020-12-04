# Prompt

## Check .zprezto/modules/prompt/functions/prompt_jvg_setup
## Annd https://github.com/xero/dotfiles/blob/master/zsh/.zsh/05-prompt.zsh

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# Create short current pwd
# Inprired by: https://github.com/sorin-ionescu/prezto/blob/master/modules/prompt/functions/prompt-pwd
function prompt-pwd {
    setopt localoptions extendedglob

    local current_pwd="${PWD/#$HOME/~}"
    local ret_directory

    if [[ "$current_pwd" == (#m)[/~] ]]; then
      ret_directory="$MATCH"
      unset MATCH
    else
      ret_directory="${${${${(@j:/:M)${(@s:/:)current_pwd}##.#?}:h}%/}//\%/%%}/${${current_pwd:t}//\%/%%}"
    fi

    unset current_pwd

    print "$ret_directory"
}

_prompt_jvg_pwd=$(prompt-pwd)


# Format: green bold branch-name bold-off(%%b) reset-color
zstyle ':vcs_info:git:*' formats '%F{28}%B%b%%b%f'
zstyle ':vcs_info:*' enable git

# Prompts
PROMPT='%F{130}$(prompt-pwd)%(!. %B%F{1}#%f%b.) ❯ %f'
RPROMPT=\$vcs_info_msg_0_
SPROMPT='zsh: correct %F{1}%R%f to %F{2}%r%f [nyae]? '
