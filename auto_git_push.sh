#!/bin/bash

# Script to auto detect changes and push to origin main

echo "Monitoring for file changes in the current directory..."

# Check for inotifywait
if ! command -v inotifywait &> /dev/null; then
    echo " 'inotifywait' is required but not installed."
    echo "Install it on Debian/Ubuntu with: sudo apt install inotify-tools"
    exit 1
fi

while true; do
    # Wait for any change in the directory
    inotifywait -r -e modify,create,delete,move . > /dev/null 2>&1

    echo "Changes detected..."

    # Stage all changes
    git add .

    # Prompt for commit message
    echo "Enter commit message and press [Enter]:"
    read -r commit_msg

    # If the message is empty, prompt again
    if [ -z "$commit_msg" ]; then
        echo "⚠️ Commit message is empty. Skipping commit."
        continue
    fi

    # Commit and push
    git commit -m "$commit_msg"
    git push origin main

    echo "✅ Changes pushed to origin main."
    echo "Watching for new changes..."
done

