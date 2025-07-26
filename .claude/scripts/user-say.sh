#!/bin/bash

# Read hook Input data from standard input
INPUT=$(cat)

# Get current session directory name (hooks run in the same directory as the session)
SESSION_DIR=$(basename "$(pwd)")

# Extract transcript_path
TRANSCRIPT_PATH=$(echo "$INPUT" | jq -r '.transcript_path')
# If transcript_path exists, get the latest assistant message
if [ -f "$TRANSCRIPT_PATH" ]; then
    # Remove newlines and limit to 60 characters
    MSG=$(tail -10 "$TRANSCRIPT_PATH" | \
          jq -r 'select(.message.role == "user") | .message.content[0].text' | \
          tail -1 | \
          tr '\n' ' ')
        #   tr '\n' ' ' | \
        #   cut -c1-60)

    # Fallback if no message is retrieved
    MSG=${MSG:-"Task completed"}
else
    MSG="Task completed"
fi

# Detect language and choose appropriate voice
VOICE="Daniel"
# Check message has Korean characters (Hangul)
if [[ "$MSG" =~ [가-힣] ]]; then
    VOICE="Yuna"
fi

# Display macOS notification with sound using osascript
say -v "$VOICE" "$MSG"
