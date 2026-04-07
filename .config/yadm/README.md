# dotfiles

Personal dotfiles managed by [yadm](https://yadm.io). Supports macOS and Arch Linux (omarchy).

## What's included

- **zsh** — unified config with OS-specific sections (homebrew on macOS, starship, zoxide, mise, fzf, antidote-managed plugins)
- **nvim** — LazyVim setup
- **git** — aliases, global gitignore, osxkeychain credential helper on macOS
- **starship** — prompt config
- **bat** — configured as pager and `cat` replacement
- **Brewfile** — macOS packages (`brew bundle --global`)
- **iTerm2** — optional custom prefs stored in `~/.config/iterm2`

## New machine setup

### macOS

```bash
# Install yadm
brew install yadm

# Clone dotfiles
yadm clone git@github.com:lassem/dotfiles.git

# Run bootstrap (installs Homebrew packages, prompts for git name/email)
yadm bootstrap

# Render OS-specific configs
yadm alt
```

### Arch Linux

```bash
# Install yadm
yay -S yadm

# Clone dotfiles
yadm clone git@github.com:lassem/dotfiles.git

# Run bootstrap (installs missing packages, prompts for git name/email)
yadm bootstrap

# Render OS-specific configs
yadm alt
```

## First-time git identity

The bootstrap script creates `~/.gitconfig.local` with your name and email. This file is **not tracked** by yadm — it stays local to each machine. On macOS, `~/.gitconfig` also enables the osxkeychain credential helper via a template block.

To set up manually without running bootstrap:

```bash
cat > ~/.gitconfig.local <<EOF
[user]
    name = Your Name
    email = you@example.com
EOF
```

## Making changes

Edit the `##t` template files, not the rendered outputs:

| Edit this | Renders to |
|-----------|-----------|
| `~/.config/zsh/plugins.txt` | Antidote plugin list |
| `~/.zshrc##t` | `~/.zshrc` |
| `~/.zshenv##t` | `~/.zshenv` |
| `~/.zprofile##t` | `~/.zprofile` |
| `~/.bash_profile##t` | `~/.bash_profile` |
| `~/.bashrc##t` | `~/.bashrc` |
| `~/.gitconfig##t` | `~/.gitconfig` |

After editing a template, regenerate:

```bash
yadm alt
```

Then commit:

```bash
yadm add ~/.zshrc##t   # or whichever file changed
yadm commit -m "..."
yadm push
```

## Notes

- `~/.zshrc.local` / `~/.localrc` — machine-specific overrides, never tracked
- `~/.antidote` — plugin manager checkout installed by bootstrap
- `~/.config/iterm2/com.googlecode.iterm2.plist` — loaded by iTerm2 when macOS defaults are applied
- `~/.config/nvim/lua/plugins/theme.lua` — omarchy-managed symlink, excluded from yadm
- The old symlink-based dotfiles live in `~/.dotfiles` and can be removed once you're satisfied
