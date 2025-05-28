#!/bin/bash

echo "Monitoring for file changes in the current directory (excluding temp files)..."

if ! command -v inotifywait &> /dev/null; then
    echo "'inotifywait' is required but not installed."
    echo "Install it on Debian/Ubuntu with: sudo apt install inotify-tools"
    exit 1
fi

while true; do
    # Watch all file events and capture the changed filename
    changed_file=$(inotifywait -r -e modify,create,delete,move --format "%f" . 2>/dev/null)

    # Ignore swap/temp files
    if [[ "$changed_file" =~ \.sw[pxo]$ ]]; then
        echo "⚠️ Ignored temporary/swap file: $changed_file"
        continue
    fi

    echo "Changes detected (excluding .swp/.swo):"

    # Stage all changes except unwanted files
    git add --all

    # Ask for commit message
    echo "Enter commit message and press [Enter]:"
    read -r commit_msg

    if [ -z "$commit_msg" ]; then
        echo "⚠️ Commit message is empty. Skipping commit."
        continue
    fi

    git commit -m "$commit_msg"
    git push origin main

    echo "✅ Changes pushed to origin main."
    echo "🔍 Watching for new changes..."
done

