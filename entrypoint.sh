#!/bin/bash

echo "=================="

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git congig --global --add  safe.directory /github/workspace

python3 /urs/bin/feed.py

git add -A && git commit -m "Update Feed"
git push --set-upstream origin main

echo "=================="