# Generate Download Stats

## What does this do?

This Node app is designed to take the API that homebrew provides for cask installs at https://formulae.brew.sh/api/analytics/cask-install/365d.json and manipulates it into something more readable for our dashboard. The end result is in the `download-stats.json` file which resides in the root directory.

## Testing

```bash
npm install
node generate-download-stats.js
```
