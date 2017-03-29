#!/bin/bash
usage() {
  echo "Usage: $0 [-u www-data] path1 path2" 1>&2; exit 1;
}

# Check if user entered arguments
if [[ $# -lt 1 ]]; then
 usage
fi

# Resetting OPTIND is necessary if getopts was used previously in the script.
OPTIND=1

# Get options
while getopts :u: opt; do
  case "$opt" in
    u) HTTPDUSER="$OPTARG";;
    *) usage >&2;;
  esac
done

# Shift option index so that $1 now refers to the first argument
shift $(($OPTIND - 1))
[[ "$1" = "--" ]] && shift

# Default HTTPDUSER
if [[ -z "$HTTPDUSER" ]]; then
  HTTPDUSER="www-data"
fi

while [[ $1 ]]; do
  if [[ -d "$1" ]] || [[ -f "$1" ]]; then
    OWNERUSER=`stat -c '%u' $1`

    # Set permission
    setfacl -R -m u:"$HTTPDUSER":rwX -m u:"$OWNERUSER":rwX $1
    setfacl -dR -m u:"$HTTPDUSER":rwX -m u:"$OWNERUSER":rwX $1
  fi
  # Next argument
  shift
done
