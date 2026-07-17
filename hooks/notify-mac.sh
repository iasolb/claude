#!/bin/bash
# Desktop notification when Claude Code is waiting on input or has finished.
# macOS only for now (osascript). No-ops silently on other platforms, add an
# equivalent branch here if this ever needs to run on Windows too.

if [[ "$(uname)" != "Darwin" ]]; then
    exit 0
fi

INPUT=$(cat)
TYPE=$(echo "$INPUT" | jq -r '.notification_type // ""' 2>/dev/null)

case "$TYPE" in
    permission_prompt|idle_prompt|agent_needs_input)
        MESSAGE="Waiting on you"
        ;;
    agent_completed)
        MESSAGE="Task finished"
        ;;
    *)
        MESSAGE="Notification"
        ;;
esac

osascript -e "display notification \"$MESSAGE\" with title \"Claude Code\"" 2>/dev/null || true
exit 0
