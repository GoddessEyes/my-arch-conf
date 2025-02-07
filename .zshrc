if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git elixir mix archlinux git pip python zsh-autosuggestions zsh-completions docker mise)

source $ZSH/oh-my-zsh.sh

if uwsm check may-start && uwsm select; then
	exec systemd-cat -t uwsm_start uwsm start default
fi

alias dcs='docker compose'
alias evpn='sudo openvpn --config ~/Express/vpn.ovpn  --auth-user-pass ~/Express/auth.txt'
alias zapret='systemctl start zapret'
alias sms='dcs up -d postgres redis cassandra etcd'

export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
eval "$(/home/goddesseyes/.local/bin/mise activate zsh)"
