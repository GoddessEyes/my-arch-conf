plugins=(git elixir mix archlinux git pip python zsh-autosuggestions zsh-completions docker mise)

alias dcs='docker compose'
alias zapret='systemctl start zapret'

export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"