# Environment
export ZSH="$HOME/.oh-my-zsh"
export XHUB="/Users/hal9000/xHub"  # Main directory

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

export EDITOR='nano'  # Default text editor (nano/vim/code)
export LANG=en_US.UTF-8

# FZF style
export FZF_DEFAULT_OPTS="
--height=85%
--border
--preview 'bat --style=numbers --color=always --line-range :500 {}'
--preview-window=right:55%
"

# ZSH theme
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
HISTSIZE=10000  # Max number history in memory
SAVEHIST=10000  # Max number history in file
setopt appendhistory  # Add new commands to history
setopt sharehistory  # Share history with all tabs

# Plugins
plugins=(
  git
  fzf-tab
  zsh-completions
  zsh-autosuggestions
  you-should-use
  zsh-syntax-highlighting
)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ZSH/oh-my-zsh.sh

# Autoload and autocomplete
autoload -U compinit && compinit  # Zsh autocomplete options

# Update Oh My Zsh
zstyle ':omz:update' mode reminder  # Remind to update oh-my-zsh
zstyle ':fzf-tab:*' fzf-flags '--ignore-case'  # FZF-tab ignore case during

# Loading aliases
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi
