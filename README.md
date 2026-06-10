# RCM CLI Distribution

Pre-built binaries and Homebrew tap for the `accelerate` CLI.

## Install

### macOS / Linux (Homebrew)

```bash
brew tap EricSanchezok/rcm-dist
brew install rcm
```

### One-line install (any platform)

```bash
curl -fsSL https://raw.githubusercontent.com/EricSanchezok/rcm-dist/main/install.sh | sh
```

### Manual download

Download the latest binary for your platform from
[Releases](https://github.com/EricSanchezok/rcm-dist/releases/latest).

| Platform | Asset |
|----------|-------|
| macOS ARM (Apple Silicon) | `accelerate-aarch64-darwin.tar.gz` |
| macOS Intel | `accelerate-x86_64-darwin.tar.gz` |
| Linux x86_64 | `accelerate-x86_64-linux.tar.gz` |
| Linux ARM64 | `accelerate-aarch64-linux.tar.gz` |
| Windows x86_64 | `accelerate-x86_64-windows.zip` |

Extract and place `accelerate` (or `accelerate.exe`) on your `PATH`.

After installation, verify:

```bash
accelerate --version
```

## Verify checksums

Each release includes `checksums.txt` with SHA256 hashes for all assets.

```bash
shasum -a 256 -c checksums.txt --ignore-missing
```
