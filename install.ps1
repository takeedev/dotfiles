$ErrorActionPreference = "Stop"

$RawBaseUrl = "https://raw.githubusercontent.com/takeedev/dotfiles/main"
$RemoteConfigDir = Join-Path $HOME ".config\takeedev-dotfiles"
$RemoteAliases = Join-Path $RemoteConfigDir "aliases.ps1"
$ProfilePath = $PROFILE.CurrentUserAllHosts

$DotfilesDir = ""
if ($PSScriptRoot) {
  $DotfilesDir = $PSScriptRoot
}

$LocalAliases = ""
if ($DotfilesDir) {
  $LocalAliases = Join-Path $DotfilesDir "shell\aliases.ps1"
}

if ($LocalAliases -and (Test-Path -LiteralPath $LocalAliases -PathType Leaf)) {
  $AliasesFile = (Resolve-Path -LiteralPath $LocalAliases).Path
}
else {
  New-Item -ItemType Directory -Force -Path $RemoteConfigDir | Out-Null
  Invoke-WebRequest -Uri "$RawBaseUrl/shell/aliases.ps1" -OutFile $RemoteAliases
  $AliasesFile = $RemoteAliases
}

$SourceLine = ". `"$AliasesFile`""
$ProfileDir = Split-Path -Parent $ProfilePath

if ($ProfileDir) {
  New-Item -ItemType Directory -Force -Path $ProfileDir | Out-Null
}

if (-not (Test-Path -LiteralPath $ProfilePath -PathType Leaf)) {
  New-Item -ItemType File -Force -Path $ProfilePath | Out-Null
}

$ExistingLines = Get-Content -LiteralPath $ProfilePath -ErrorAction SilentlyContinue
if ($ExistingLines -contains $SourceLine) {
  Write-Host "Already installed: $SourceLine"
}
else {
  Add-Content -LiteralPath $ProfilePath -Value ""
  Add-Content -LiteralPath $ProfilePath -Value "# dotfiles aliases"
  Add-Content -LiteralPath $ProfilePath -Value $SourceLine
  Write-Host "Added aliases source line to $ProfilePath"
}
