export ZSH="$HOME/.oh-my-zsh"  # Path to oh-my-zsh
export XHUB="/Users/hal9000/xHub"  # Main directory xHub
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export EDITOR='nano'  # Default text editor (nano/vim/code)
export LANG=en_US.UTF-8
export FZF_DEFAULT_OPTS="
--height=85%
--border
--preview 'bat --style=numbers --color=always --line-range :500 {}'
--preview-window=right:55%
"

ZSH_THEME="powerlevel10k/powerlevel10k"
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -f ~/.p10k.zsh ]; then
    source ~/.p10k.zsh
fi

# Autocomplete options
CASE_SENSITIVE="false"  # Ignore case during autocompletion
HYPHEN_INSENSITIVE="false"  # Consider the symbols "-" and "_" as different

# History settings
HISTSIZE=10000  # Max number history numbers in memory
SAVEHIST=10000  # Max number history numbers in file
setopt appendhistory  # Add new commands to history
setopt sharehistory  # Share history with all tabs

plugins=(
  git
  fzf-tab
  zsh-completions
  zsh-autosuggestions
  you-should-use
)

source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/custom/plugins/fzf-tab/fzf-tab.plugin.zsh

autoload -U compinit && compinit  # Zsh autocomplete options

zstyle ':omz:update' mode reminder  # Remind to update oh-my-zsh
zstyle ':fzf-tab:*' fzf-flags '--ignore-case'  # FZF-tab ignore case during

if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi
