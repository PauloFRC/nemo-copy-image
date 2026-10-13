# nemo-copy-image

Right-click image in Nemo -> **Copy image content**.
Copies the picture itself, not the file. Paste in chat, browser, editor.

For Linux Mint (Cinnamon, X11).

## Install

```
sudo apt install imagemagick xclip
git clone https://github.com/<you>/nemo-copy-image
cd nemo-copy-image
./install.sh
```

Script restarts Nemo. Open Nemo windows close.

## Use

Select **one** image. Right-click. Pick **Copy image content**.
Menu hidden for folders, many files, non-images.

## Remove

```
./uninstall.sh
```

## Not work?

- Wayland: no. Uses `xclip`, X11 only.
- No menu entry: run `nemo -q`, open Nemo again.
- Files live in `~/.local/share/nemo/actions/`.
