# ==============================================
# History
# ==============================================
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# ==============================================
# Editor & environment
# ==============================================
export EDITOR=zed
export ZED_ALLOW_ROOT=true
export PNPM_HOME="$HOME/.local/share/pnpm"
typeset -U path
path=("$PNPM_HOME" $path)

# ==============================================
# Oh My Zsh
# ==============================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
source $ZSH/oh-my-zsh.sh

# ==============================================
# Aliases
# ==============================================
alias dcs='docker compose'
alias zapret-config='$HOME/zapret-configs/install.sh'
alias zapret-utils='$HOME/zapret-configs/utils-zapret.sh'
alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first'
alias tree='eza --tree'
alias cat='bat --style=plain --paging=never'
alias ..='cd ..'
alias ...='cd ../..'

# ==============================================
# JetBrains VM options
# ==============================================
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"
[[ -f "$___MY_VMOPTIONS_SHELL_FILE" ]] && . "$___MY_VMOPTIONS_SHELL_FILE"

# ==============================================
# Zinit
# ==============================================
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33}Installing Zinit…%f"
    mkdir -p "$HOME/.local/share/zinit" && chmod g-rwX "$HOME/.local/share/zinit"
    git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" \
        && print -P "%F{33}Installation successful.%f" \
        || print -P "%F{160}The clone has failed.%f"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# OMZ plugins
zinit snippet OMZP::archlinux

# Third-party
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light Aloxaf/fzf-tab
zinit light zdharma-continuum/fast-syntax-highlighting

# mise
zinit as="command" lucid from="gh-r" for \
    id-as="usage" atpull="%atclone" jdx/usage

zinit as="command" lucid from="gh-r" for \
    id-as="mise" mv="mise* -> mise" \
    atclone="./mise* completion zsh > _mise" \
    atpull="%atclone" \
    atload='eval "$(mise activate zsh)"' \
    jdx/mise

# ==============================================
# zoxide
# ==============================================
eval "$(zoxide init zsh)"

# ==============================================
# Keybinds
# ==============================================
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# ==============================================
# Optional env
# ==============================================
[[ -f "$HOME/bin/env" ]] && source "$HOME/bin/env"

eval "$(starship init zsh)"

# ==============================================
# uwsm auto-start
# ==============================================
if uwsm check may-start > /dev/null 2>&1 && uwsm select; then
    exec uwsm start default
fi
