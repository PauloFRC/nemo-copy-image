#!/bin/bash
# Remove menu entry. Nemo restart, windows close.
dir="$HOME/.local/share/nemo/actions"
rm -f "$dir/copy-image-content.sh" "$dir/copy-image-content.nemo_action"
nemo -q 2>/dev/null || true
sleep 1
nohup nemo >/dev/null 2>&1 &
disown
echo "Gone."
