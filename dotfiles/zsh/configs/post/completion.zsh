#
# Compile the completion dump to increase startup speed.
#
# Authors: Dan Riley <hello@danriley.me>
# License: beerware.
#

{
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!