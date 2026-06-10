# RCM Windows Installer
# Usage: irm https://raw.githubusercontent.com/EricSanchezok/rcm-dist/main/install.ps1 | iex

param(
  [string]$Version = ""
)

$ErrorActionPreference = "Stop"

$Repo = "EricSanchezok/rcm-dist"
$BaseUrl = "https://github.com/$Repo/releases"
$BinName = "accelerate"

# Resolve version
if (-not $Version) {
  $ReleaseUrl = "https://api.github.com/repos/$Repo/releases/latest"
  $Release = Invoke-RestMethod -Uri $ReleaseUrl -ErrorAction Stop
  $Version = $Release.tag_name
}

Write-Host "Installing $BinName $Version for Windows x86_64 ..."

# Download
$ArchiveName = "${BinName}-x86_64-windows.zip"
$DownloadUrl = "${BaseUrl}/download/${Version}/${ArchiveName}"
$TempDir = Join-Path $env:TEMP "rcm-install-$([System.Guid]::NewGuid().ToString('N').Substring(0, 8))"

New-Item -ItemType Directory -Path $TempDir -Force | Out-Null
$ArchivePath = Join-Path $TempDir $ArchiveName

Write-Host "Downloading from $DownloadUrl ..."
Invoke-WebRequest -Uri $DownloadUrl -OutFile $ArchivePath

# Extract
Expand-Archive -Path $ArchivePath -DestinationPath $TempDir -Force

# Install
$InstallDir = if ($env:RCM_INSTALL_DIR) { $env:RCM_INSTALL_DIR } else { "$env:USERPROFILE\.rcm\bin" }
New-Item -ItemType Directory -Path $InstallDir -Force | Out-Null
Copy-Item -Path "$TempDir\${BinName}.exe" -Destination "$InstallDir\${BinName}.exe" -Force

# Add to PATH (current session)
$env:Path = "$InstallDir;" + $env:Path

# Add to PATH (permanent, user-level)
$UserPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($UserPath -notlike "*$InstallDir*") {
  [Environment]::SetEnvironmentVariable("Path", "$UserPath;$InstallDir", "User")
}

# Cleanup
Remove-Item -Recurse -Force $TempDir

Write-Host ""
Write-Host "Installed ${BinName}.exe -> $InstallDir"
Write-Host ""
Write-Host "Run 'accelerate --help' to get started."
Write-Host ""
