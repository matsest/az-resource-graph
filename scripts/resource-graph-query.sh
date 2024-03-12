#!/bin/bash

FILE=$1

if [[ ! -f "${FILE}" ]]; then
  echo "${FILE} is not a file"
  exit 1
fi

QUERY=$(cat "${FILE}")

az graph query -q "${QUERY}" -o table