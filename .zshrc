if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
eval "$(/usr/bin/mise activate zsh)"

export ZSH="~/.oh-my-zsh"

PATH=$PATH:~/.local/bin


alias dcs='docker compose'
alias zapret='systemctl start zapret'
. ~/.ghcup/env

plugins=(autoupdate git elixir mix archlinux git pip python zsh-autosuggestions zsh-completions docker)
source $ZSH/oh-my-zsh.sh


source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi