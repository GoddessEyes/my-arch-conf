export ZSH="/home/goddesseyes/.oh-my-zsh"
PATH=$PATH:/home/goddesseyes/.local/bin

ZSH_THEME="candy"

alias dcs='docker-compose'
alias fixown='sudo chown -R goddesseyes:wheel .'


plugins=(archlinux asdf git pip python zsh-autosuggestions zsh-completions docker docker-completion)
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.poetry/bin:$PATH"
