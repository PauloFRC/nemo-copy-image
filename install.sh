#!/bin/bash
# Add "Copy image content" to Nemo right-click menu.
# Copies picture pixels, not file. Paste into chat, editor, etc.
set -euo pipefail

dir="$HOME/.local/share/nemo/actions"
mkdir -p "$dir"

# Need these two tools. No tool, no work.
for dep in convert xclip; do
    command -v "$dep" >/dev/null || { echo "Missing $dep. Run: sudo apt install imagemagick xclip"; exit 1; }
done

# Helper: any image -> png -> clipboard
cat > "$dir/copy-image-content.sh" <<'EOF'
#!/bin/bash
set -o pipefail
convert "$1" png:- | xclip -selection clipboard -t image/png -i
EOF
chmod +x "$dir/copy-image-content.sh"

# Menu entry. Full path in Exec: <script> form did not work.
cat > "$dir/copy-image-content.nemo_action" <<EOF
[Nemo Action]
Name=Copy image content
Comment=Copy the image pixels to the clipboard
Exec=$dir/copy-image-content.sh %F
Selection=s
Mimetypes=image/*;
Quote=double
Dependencies=convert;xclip;
EOF

# Nemo read actions only at start. Restart it (closes Nemo windows).
nemo -q 2>/dev/null || true
sleep 1
nohup nemo >/dev/null 2>&1 &
disown
echo "Done. Right-click ONE image in Nemo -> Copy image content."
