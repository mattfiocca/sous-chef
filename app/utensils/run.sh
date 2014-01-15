# set stage
source ./utensils/stage.sh

# we need configs
source ./config/$STAGE.sh

# determine OS selection
source ./utensils/os.sh

if [ ! -d ./$SOUS_DIR/ingredients/$OS ]; then
    echo "Your missing a vital directoy: ./$SOUS_DIR/ingredients/$OS"
    exit
fi

# helper functions to wrap the ingredient path in the recipe
function use {
	if [[ -z "$1" ]]; then
	    echo "Oops! You tried to grab a source file without telling us what to grab"
	    exit
	fi
	if [ ! -f ./ingredients/$OS/$1.sh ]; then
	    echo "Oops! You tried to grab this source file, but it doesn't exist: ingredients/$OS/$1.sh"
	    exit
	fi
	source ./ingredients/$OS/$1.sh
}

function common {
	if [ ! -f ./ingredients/common/$1.sh ]; then
	    echo "Oops! You tried to grab this common file, but it doesn't exist: ingredients/common/$1.sh"
	    exit
	fi
	source ./ingredients/common/$1.sh
}

# run the recipe
source ./recipes/$STAGE.sh