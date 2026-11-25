# tty-session

Launch any single GUI application directly from a Linux TTY (`tty1`) inside a temporary Xorg + Openbox session, returning cleanly to the terminal when the application closes.

---

## Prerequisites (Arch Linux)

Before installing or running `session`, make sure your system meets the following requirements:

### 1. Required Packages
Install the minimal Xorg display server, `xinit` wrapper, and Openbox window manager:

```bash
sudo pacman -S xorg-server xorg-xinit openbox
```

### 2. Graphics Drivers
Ensure you have the appropriate open-source or proprietary GPU drivers installed so Xorg can initialize your display:
* **Intel:** `sudo pacman -S mesa`
* **AMD:** `sudo pacman -S mesa`
* **NVIDIA:** `sudo pacman -S nvidia nvidia-utils`
* **Virtual Machines (QEMU/VirtualBox/VMware):** `sudo pacman -S mesa`

### 3. Add `~/.local/bin` to Your `$PATH`
The installer places the `session` command in `~/.local/bin/session`. On a fresh Arch Linux installation, `~/.local/bin` is not included in `$PATH` by default.

Add it to your shell configuration file:

* **For Bash (`~/.bashrc`):**
  ```bash
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
  source ~/.bashrc
  ```

* **For Zsh (`~/.zshrc`):**
  ```bash
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
  source ~/.zshrc
  ```

---

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com<your-username>/tty-session.git
   cd tty-session
   ```

2. **Make the installer executable and run it:**
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

*(No manual edits to `install.sh` or `session` are required.)*

---

## Usage

From `tty1` (or any virtual console), run `session` followed by the GUI program name and any optional arguments:

```bash
session code
session code ~/projects/my-app
session firefox
session nemo ~/Documents
```

When you close the application window, Openbox and Xorg automatically shut down and return you straight to the TTY prompt.

---

## Troubleshooting

* **Command not found (`session: command not found`):** Verify that `~/.local/bin` is in your `\(PATH` by running `echo \)PATH`, or reload your shell config with `source ~/.bashrc`.
* **App opens and immediately drops back to TTY:** Some Electron or browser-based applications fork into the background by default. Pass a foreground or new-window flag directly to `session` (e.g., `session chromium --new-window`). Note that `--wait` is already handled automatically for `code` and `code-oss`.
* **Black screen or Xorg startup failure:** Check `~/.local/share/xorg/Xorg.0.log` to confirm your GPU drivers are loaded properly.
