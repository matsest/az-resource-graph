#!/bin/bash

FILE=$1

if [[ ! -f "${FILE}" ]]; then
  echo "${FILE} is not a file"
  exit 1
fi

# check that jq is installed
if ! command -v jq &> /dev/null; then
    echo "jq is not installed. Please install jq before running this script."
    exit 1
fi

QUERY=$(cat "${FILE}")

# hack using jq to format output
# shellcheck disable=SC2312
az graph query -q "${QUERY}" -o json \
| jq --raw-output '.data |  [.[]| with_entries( .key |= ascii_downcase ) ] |    (.[0] |keys_unsorted | @tsv), (.[]|.|map(.) |@tsv)' \
| column -t