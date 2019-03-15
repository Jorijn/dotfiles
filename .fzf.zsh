# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/share/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/share/fzf/shell/key-bindings.zsh"

