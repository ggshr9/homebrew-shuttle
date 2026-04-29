# Homebrew Tap for Shuttle

Official Homebrew tap for [Shuttle](https://github.com/ggshr9/shuttle), a multi-transport network toolkit.

> **Status:** This tap is scaffolding until the first `v*` tag lands on the upstream repo.
> The formulae will become functional automatically when
> [`mislav/bump-homebrew-formula-action`](https://github.com/mislav/bump-homebrew-formula-action)
> updates them on first release.

## Install

```bash
brew tap ggshr9/shuttle
brew install shuttle    # CLI client
brew install shuttled   # server daemon
```

## Run shuttled as a service

```bash
shuttled init                        # generate config
brew services start shuttled         # launchd service
```

Logs land at `$(brew --prefix)/var/log/shuttled.log` (and `.err.log`).

## Updating

```bash
brew update
brew upgrade shuttle shuttled
```

This tap is auto-PR'd from the main `shuttle` repo on each release. If you spot a stale formula, please file an issue here.
