# Homebrew tap for portal-credits

The Portal (2007) end credits, recreated in your terminal.

```bash
brew tap panch076/portal-credits
brew install portal-credits
portal-credits
```

The song is not included — drop your own copy of "Still Alive" in
`$(brew --prefix)/share/portal-credits/still-alive.mp3` and the CLI picks it up:

```bash
cp /path/to/portal_still_alive.mp3 "$(brew --prefix)/share/portal-credits/still-alive.mp3"
```

Main project: <https://github.com/panch076/portal-credits>
