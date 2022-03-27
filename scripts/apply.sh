#!/bin/bash

## for normalize
brew_prefix="$(brew --prefix)"
if [[ -z "${brew_prefix}" ]]; then
    brew_prefix='/usr/local'
fi

# coreutils
export PATH="${brew_prefix}/opt/coreutils/libexec/gnubin:${PATH}"
export MANPATH="${brew_prefix}/opt/coreutils/libexec/gnuman:${MANPATH}"

# ed
export PATH="${brew_prefix}/opt/ed/libexec/gnubin:${PATH}"
export MANPATH="${brew_prefix}/opt/ed/libexec/gnuman:${MANPATH}"

# findutils
export PATH="${brew_prefix}/opt/findutils/libexec/gnubin:${PATH}"
export MANPATH="${brew_prefix}/opt/findutils/libexec/gnuman:${MANPATH}"

# sed
export PATH="${brew_prefix}/opt/gnu-sed/libexec/gnubin:${PATH}"
export MANPATH="${brew_prefix}/opt/gnu-sed/libexec/gnuman:${MANPATH}"

# tar
export PATH="${brew_prefix}/opt/gnu-tar/libexec/gnubin:${PATH}"
export MANPATH="${brew_prefix}/opt/gnu-tar/libexec/gnuman:${MANPATH}"

# grep
export PATH="${brew_prefix}/opt/grep/libexec/gnubin:${PATH}"
export MANPATH="${brew_prefix}/opt/grep/libexec/gnuman:${MANPATH}"
