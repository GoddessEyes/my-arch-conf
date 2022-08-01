export ZSH="/home/goddesseyes/.oh-my-zsh"
PATH=$PATH:/home/goddesseyes/.local/bin

ZSH_THEME="candy"

alias dcs='docker-compose'
alias fixown='sudo chown -R goddesseyes:wheel .'
alias go_gs_vpn='openvpn3 session-start --config ~/GsLabs/Common/igor.shcherbakov.ovpn'
alias stop_gs_vpn='openvpn3 session-manage --config ~/GsLabs/Common/igor.shcherbakov.ovpn --disconnect'


plugins=(git pip python zsh-autosuggestions zsh-completions docker docker-compose)
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.poetry/bin:$PATH"
