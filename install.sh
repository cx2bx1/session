#!/usr/bin/env bash
set -euo pipefail

mkdir -p "$HOME/.local/bin"
cp session "$HOME/.local/bin/session"
chmod +x "$HOME/.local/bin/session"

echo "Installed 'session' to $HOME/.local/bin/session"
echo "Ensure \$HOME/.local/bin is in your PATH and 'xorg-server', 'xorg-xinit', and 'openbox' are installed."
