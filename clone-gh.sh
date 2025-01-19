#!/bin/bash
set -eu

repo="$(echo "$1" | sed -r -e 's|https?://github.com/([^/]+)/([^/]+).*|\1/\2|')"
repo_dir=~/workspace/github.com/$repo

cd ~/workspace/github.com/

if [ -d "$repo_dir" ]; then
  # pull changes
  echo "dir already exists, pulling latest changes..."
  cd "$repo_dir"
  git pull origin main || git pull origin master
else
  # clone
  mkdir -p "$repo_dir"
  git clone "ssh://git@github.com/$repo" "$repo_dir"
fi

# copy dir to clipboard
echo "$repo_dir" | clip.exe
echo "dir copied to clipboard: $repo_dir"
