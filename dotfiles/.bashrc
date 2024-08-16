eval "$(/opt/homebrew/bin/brew shellenv)"

[[ -r ~/local/devenv/apply.sh ]] && . ~/local/devenv/apply.sh

source ~/.bash/.theme.bash
source ~/.bash/.bashenv
source ~/.bash/.alias.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
