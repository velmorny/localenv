[[ -r ~/local/devenv/apply.sh ]] && . ~/local/devenv/apply.sh

source ~/.bash/.theme.bash
source ~/.bash/.bashenv
source ~/.bash/.alias.bash

eval "$(/opt/homebrew/bin/brew shellenv)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
