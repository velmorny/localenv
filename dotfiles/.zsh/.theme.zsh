# enable to use variables in prompt
setopt PROMPT_SUBST

# define local color
local_red="%F{168}"
local_green="%F{113}"
local_reset="%f"

# set prompt
PROMPT=$'\n%{$local_green%}%~%{$local_reset%}\n%(?.%{%F{white}%}.%{$local_red%})%(!.#.>) '
