#
# Sets EDITOR, CVSEDITOR, and GIT_EDITOR env variables.
#
# Authors: Dan Riley <hello@danriley.me>
# License: beerware.
#

export EDITOR
export CVSEDITOR
export GIT_EDITOR

# Define an order or preference for text editors
local editors
editors=(vim mate mvim gvim nano pico)

# Look for the first of these editors which exists
for editor ($editors) {
    if [[ -x $(which $editor) ]]; then
        EDITOR=$editor
        break
    fi
}

# Some editors need specific arguments for VCS
if [[ $EDITOR == 'mvim' || $EDITOR == 'gvim' ]]; then
    export CVSEDITOR="$EDITOR -f" # Don't fork.
    export GIT_EDITOR="$EDITOR -f" # Don't fork.
fi

# Print a warning if there's still no editor set.
[[ -z $EDITOR ]] && print 'No editor set.'

# TextMate specific stuff:
if [[ $EDITOR == 'mate' && -x $(which bundle) && -n $(bundle) && $? = 0 && -z $SSH_CLIENT ]]; then
	EDITOR="mate -w"
	# Useful functions for bundle development
    function reload_textmate(){
      osascript -e 'tell app "TextMate" to reload bundles'
    }
    function bundle () {
      cd "$HOME/Library/Application Support/TextMate/Bundles/$1.tmbundle"
    }
    _bundle() {
      bundle_path="$HOME/Library/Application Support/TextMate/Bundles"
      compadd $(print -l $bundle_path/*.tmbundle(:t:r))
    }
fi

# Set EDITOR as default for plaintext stuff
for s in txt tex c cc cxx cpp gp m md markdown otl; do
	alias -s $s=$EDITOR
done

# Abuse the "open" command on OS X
if [[ $OSTYPE[1,6] == "darwin" ]]; then
	for s in mp3 wav aac \
		ogg avi mp4 m4v mov qt mpg mpeg \
		jpg jpeg png psd bmp gif tif tiff \
		eps ps pdf html dmg; do
		alias -s $s=open
	done
fi
