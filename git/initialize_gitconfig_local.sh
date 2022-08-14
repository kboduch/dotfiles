#!/usr/bin/env bash

set -e

if [ ! -f ~/.gitconfig.local ]; then
    cp ./git/gitconfig.local ~/.gitconfig.local
    echo "Enter name and email: ${EDITOR:-vi}" ~/.gitconfig.local
  else
    echo "File already initialized"
fi
