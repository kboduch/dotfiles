#!/bin/bash

LAST_RUN_FILE="$HOME/.last_chezmoi_update_execution_timestamp.txt"
CURRENT_TIMESTAMP=$(date +%s)
ONE_DAY_SECONDS=$((24 * 60 * 60))
CURRENT_HOUR=$(date +%H)

if [ "$CURRENT_HOUR" -lt 19 ] || [ "$CURRENT_HOUR" -gt 23 ]; then
  exit 0
fi

if [ -f "$LAST_RUN_FILE" ]; then
  LAST_RUN_TIMESTAMP=$(cat "$LAST_RUN_FILE")
  TIME_DIFF=$((CURRENT_TIMESTAMP - LAST_RUN_TIMESTAMP))
  if [ $TIME_DIFF -lt $ONE_DAY_SECONDS ]; then
    exit 0
  fi
fi

read -p "The last chezmoi update was over 24 hours ago. Would you like to run it now (y/n)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  source ~/.kboduch/common.lib.sh
  run_command "chezmoi update"
  echo "$CURRENT_TIMESTAMP" > "$LAST_RUN_FILE"
fi
