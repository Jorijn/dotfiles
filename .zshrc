export ZSH=/Users/jorijn/.oh-my-zsh
export PATH="$HOME/bin:/usr/local/sbin:$HOME/.composer/vendor/bin:$HOME/bin:/usr/local/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.symfony/bin:$PATH"
export EDITOR=vi
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# oh-my-zsh
ZSH_THEME=""
plugins=(git osx cp supervisor laravel symfony2 composer brew kubectl)
source $ZSH/oh-my-zsh.sh

# aliases
alias tunnel='sshuttle --dns --daemon --pidfile=/tmp/sshuttle.pid --remote=jorijn@ssh.jorijn.com 0/0'
alias tunnelx='[[ -f /tmp/sshuttle.pid ]] && kill $(cat /tmp/sshuttle.pid) && echo "SSH tunnel disconnected"'
alias nano=vi
alias renamer='curl http://10.0.1.2:5050/api/a9fc1f1a10e246b8a8f3b88d5ec9bc20/renamer.scan'
alias phpprofiler='php -d xdebug.profiler_enable=On'
alias phpdebug='php -dxdebug.remote_enable=1 -dxdebug.remote_autostart=On -dxdebug.idekey=phpstorm'
alias cat=bat
alias ping='prettyping --nolegend'
alias top='sudo htop'
alias dc='docker-compose'
alias gc='git checkout'
alias pst='phpstan analyse --level=max'
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

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

listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

autoload -U promptinit; promptinit
prompt pure

# fzf, autojump
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jorijn/Development/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jorijn/Development/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jorijn/Development/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jorijn/Development/google-cloud-sdk/completion.zsh.inc'; fi

