# -----------------------------------------------------------------------------
#          FILE: bao.zsh-theme
#   DESCRIPTION: oh-my-zsh theme file, based on Marc Cornellà(https://github.com/mcornella).
#        AUTHOR: Bao Ho
#       VERSION: 0.1
# -----------------------------------------------------------------------------

# Reset color.
baoho_reset_color="%f"


# # Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX=" | "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" >"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✔"

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}?"


# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg_bold[white]%}^"


# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%f➤ %{$FG[116]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"


# # Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[cyan]%}"


# autoload -U add-zsh-hook
# autoload -Uz vcs_info

# zstyle ':vcs_info:*' enable git svn
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' unstagedstr    "${FMT_UNSTAGED}"
# zstyle ':vcs_info:*' stagedstr      "${FMT_STAGED}"
# zstyle ':vcs_info:*' actionformats  "${FMT_VCS_STATUS} ${FMT_ACTION}"
# zstyle ':vcs_info:*' formats        "${FMT_VCS_STATUS}"
# zstyle ':vcs_info:*' nvcsformats    ""
# zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

right_triangle() {
   echo $'\u271a'
}


local LAMBDA="%(?,%{$fg_bold[green]%}λ %*,%{$fg_bold[red]%}λ %*)%f ✱"
if [[ "$USER" == "root" ]]; then USERCOLOR="red"; else USERCOLOR="yellow"; fi


function check_git_prompt_info() {
    if type git &>/dev/null && git rev-parse --git-dir > /dev/null 2>&1; then
        if [[ -z $(git_prompt_info 2> /dev/null) ]]; then
            echo "%{$fg[blue]%}detached-head) $(git_prompt_status)\n%{$fg[yellow]%}→ "
        else
            echo "$(git_prompt_info 2> /dev/null) $(git_prompt_status)\n%{$fg_bold[white]%}→ "
        fi
    else
        echo "%{$fg_bold[white]%}→ "
    fi
}

PROMPT=$'%\n%{$FG[0]%}'$LAMBDA' %{$fg_bold[$USERCOLOR]%}[%n]%f\
 %F{107}%'${LAMBDA_MOD_N_DIR_LEVELS:-5}'~\
 $(git_prompt_short_sha)$(check_git_prompt_info)'