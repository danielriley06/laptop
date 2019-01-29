#
# Sets the LANG env variable.
#
# Authors: Dan Riley <hello@danriley.me>
# License: beerware.
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi