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
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/custom/plugins/fzf-tab/fzf-tab.plugin.zsh

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

autoload -U compinit && compinit  # Zsh autocomplete options

zstyle ':omz:update' mode reminder  # Remind to update oh-my-zsh
zstyle ':fzf-tab:*' fzf-flags '--ignore-case'  # FZF-tab ignore case during


# Aliases for Python
alias py="python3"
alias pi="pip install"
alias venv="source .venv/bin/activate"
alias venvd="deactivate"

# Aliases for Git
alias g="git"
alias gst="git status"
alias gs="git status"
alias gsw="git switch"
alias gpo="git push origin"
alias ga="git add"
alias gcm="git commit -m"
# Merging the main and develop branches and sending changes to the remote repository
alias gswm="git switch main && git merge develop && git push origin main develop"
alias gswd="git switch develop && git merge main && git push origin main develop"

# Aliases for work with directories
alias mkcd="mkdir -p '$1' && cd '$1'"
alias cdpr="cd $XHUB/programming_ws"
alias cdpj="cd $XHUB/programming_ws/projects_ws"
alias cdsb="cd $XHUB/programming_ws/projects_ws/sandbox_py"
alias cddw="cd $HOME/Downloads"
alias cdx="cd $XHUB"  # Change to xHub root directory
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Aliases FZF
alias fs="fzf | xargs bat"  # File search and open it in terminal
alias fo="find . -type d | fzf | xargs open"  # Directory search and opening it in Finder
alias ff="find . -type f | fzf"  # Improved file search
alias fd="find . -type d | fzf"  # Improved directory search
alias fcd="cd \$(find . -type d | fzf)"  # Directory search and opening it in terminal
alias fe="fzf | xargs -o $EDITOR"  # File search and open it in code-editor
alias fh="history | sort -r | fzf"  # History search
alias frm="find . -type f | fzf | xargs trash-put"  # Search file and remove it with trash-cli (safe)

# Aliases trash
alias tp="trash-put"
alias te="trash-empty"
alias tr="trash-restore"
alias tl="trash-list"
alias tr="trash-rm"

# Aliases misc
alias cls="clear"
alias reload="source ~/.zshrc; echo 'ZSH Reloaded!'"  # Reload zsh configuration
alias ll="eza --tree --level=1 --icons=auto --no-user --no-permissions --sort type"  # Improved ls
alias cat="bat"  # Improved cat
alias myip="curl -s ifconfig.me; echo"
alias speedtest="speedtest-cli"
alias rg="rg --ignore-case"  # ripgrep ignore case during
alias pony="echo 'hint' | bat"  # Displaying a text hints
