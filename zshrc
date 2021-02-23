export ZSH="/Users/bao.ho/.oh-my-zsh"

ZSH_THEME="baoho"
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder
plugins=(
 # fzf
  git
 # vi-mode
  #battery
  zsh-syntax-highlighting
  #zsh-autosuggestions
  zsh-completions
  history-substring-search
) 

autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh
source /Users/bao.ho/Configuration/Env/base_env
alias log-tdss-api='tail -f /var/log/aip/v3.2/app.log'

# export LANG=en_US.UTF-8


bindkey "^O" forward-word
bindkey "^b" backward-word

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi
# source ~/.fzf.zsh
# export FZF_DEFAULT_COMMAND='rg --files --no-hidden --follow'
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

