export ZSH=/Users/jorijn/.oh-my-zsh
export PATH="$HOME/bin:/usr/local/sbin:$HOME/.composer/vendor/bin:$HOME/bin:/usr/local/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export EDITOR=vi
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# php
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"

# oh-my-zsh
ZSH_THEME=""
plugins=(git osx cp supervisor laravel symfony2 composer brew)
source $ZSH/oh-my-zsh.sh

# aliases
alias tunnel='sshuttle --dns --daemon --pidfile=/tmp/sshuttle.pid --remote=jorijn@ssh.jorijn.com 0/0'
alias tunnelx='[[ -f /tmp/sshuttle.pid ]] && kill $(cat /tmp/sshuttle.pid) && echo "SSH tunnel disconnected"'
alias nano=vi
alias renamer='curl http://192.168.116.2:5050/api/a9fc1f1a10e246b8a8f3b88d5ec9bc20/renamer.scan'
alias phpprofiler='php -d xdebug.profiler_enable=On'
alias phpdebug='php -dxdebug.remote_enable=1 -dxdebug.remote_autostart=On -dxdebug.idekey=phpstorm'
alias cat=bat
alias ping='prettyping --nolegend'
alias top='sudo htop'
alias dc='docker-compose'
alias gc='git checkout'

# includes
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# handy functions
function drain_gearman() {
    gearman -t 1000 -n -w -f $1 > /dev/null
}

function moveebms {
    set -x
    payload="`grep -ri $1 . |cut -d: -f1`"
    file="`grep -ri \"$payload\" . |cut -d: -f1`"
    mv $file $2
    mv $payload $2
}

# Yubikey GPG config
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye

# fzf, autojump
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# pure prompt
autoload -U promptinit; promptinit
prompt pure
