# Symlinks this repo's tracked config into ~/.claude.
# Run from anywhere; resolves paths relative to this script's location.
# Existing targets are backed up with a .bak suffix before being replaced,
# never silently overwritten.

$repoRoot = Split-Path -Parent $PSScriptRoot
$claudeDir = Join-Path $env:USERPROFILE ".claude"

$items = @("CLAUDE.md", "settings.json", "commands", "agents", "rules", "hooks")

foreach ($item in $items) {
    $source = Join-Path $repoRoot $item
    $target = Join-Path $claudeDir $item

    if (Test-Path $target) {
        $isSymlink = (Get-Item $target -Force).LinkType -eq "SymbolicLink"
        if ($isSymlink) {
            Remove-Item $target -Force
        } else {
            Move-Item $target "$target.bak" -Force
            Write-Host "Backed up existing $item to $item.bak"
        }
    }

    try {
        New-Item -ItemType SymbolicLink -Path $target -Target $source -Force -ErrorAction Stop | Out-Null
        Write-Host "Linked $item"
    } catch {
        Write-Host "FAILED to link $item : $($_.Exception.Message)" -ForegroundColor Red
    }
}
