#
# Sets BROWSER env variable.
#
# Authors: Dan Riley <hello@danriley.me>
# License: beerware.
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi