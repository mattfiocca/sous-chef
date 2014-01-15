echo "Setting Stage"

if [[ -z "$1" ]]; then
	echo "Please provide a deployment stage, e.g. production, staging, etc."
	exit
fi

STAGE=$1