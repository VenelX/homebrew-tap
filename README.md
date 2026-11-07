# VenelX Studio for Mac

Downloads and the Homebrew cask for [VenelX Studio](https://studio.venelx.com), the Mac app that turns your Mac into
your team's mobile release machine. The app's source isn't here; this repository only holds releases.

## Install

**Download:** [VenelX-Studio.dmg](https://github.com/VenelX/homebrew-tap/releases/latest/download/VenelX-Studio.dmg)
(newest release), open it and drag VenelX Studio to Applications.

**Homebrew:**

```bash
brew install --cask venelx/tap/venelx
```

or tap once and then use the short name:

```bash
brew tap venelx/tap
brew install --cask venelx
```

Update with `brew upgrade --cask venelx`; remove with `brew uninstall --cask venelx` (add `--zap` to also delete
its settings and data).

Needs macOS 15 or later, on Apple silicon or Intel.

### First open

Beta builds aren't notarized by Apple yet. The first time you open VenelX Studio, macOS says it can't check the app.
Open **System Settings › Privacy & Security**, scroll to the message about VenelX Studio and click **Open Anyway**.
You only do this once per install.

## Releases

Each release has `VenelX-Studio-<version>.dmg` (the cask downloads this one) and `VenelX-Studio.dmg` (the same file,
so the link above always gets the newest). Check a download against the SHA-256 in the release notes.
