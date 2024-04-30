#!/bin/bash

SHELL_TYPE='bash'

## for normalize
brew_prefix="$(brew --prefix)"
if [[ -z "${brew_prefix}" ]]; then
    brew_prefix='/usr/local'
fi

basedir="${HOME}/local/devenv"
bindir="${basedir}/bin"

export PATH="${bindir}:${PATH}"

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

## for direnv
if command -v direnv 2>&1 >/dev/null; then
  eval "$(direnv hook "${SHELL_TYPE}")"
fi

## golang
export PATH=$PATH:$(go env GOPATH)/bin

## for google cloud sdk
path_inc="${brew_prefix}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.${SHELL_TYPE}.inc"
completion_inc="${brew_prefix}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.${SHELL_TYPE}.inc"
[[ -r "${path_inc}" ]] && . "${path_inc}"
[[ -r "${completion_inc}" ]] && . "${completion_inc}"
