# .zshrc

[[ -r ~/local/devenv/apply.sh ]] && . ~/local/devenv/apply.sh

# compile (if you have no .zshrc.zwc, execute "zcompile .zshrc" once)
if [ $ZDOTDIR/.zshrc -nt $ZDOTDIR/.zshrc.zwc ]; then
  zcompile $ZDOTDIR/.zshrc
fi

# Completion
autoload -Uz compinit
compinit

# Color
autoload -Uz colors
colors
 
# Load theme
source $ZDOTDIR/.theme.zsh

# Load profile
source $ZDOTDIR/.zprofile

# Use vim key bind
bindkey -v

# Directory Stack
setopt auto_pushd
# Ignore pushd duplication
setopt pushd_ignore_dups
# Change directory without cd command
setopt auto_cd
# Ignore history duplication
setopt hist_ignore_all_dups
# Redule blank
setopt hist_reduce_blanks
# Ignore space
setopt hist_ignore_space

# Use user local path 
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
