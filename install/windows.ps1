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

# Cross-machine session memory: link the current project's memory dir to the
# repo's memory/ so memories written on either machine sync through git.
# Claude Code derives the project key from the session's actual working
# directory by swapping path separators (and the drive colon) for dashes
# (C:\Users\Ian -> C--Users-Ian, bare C:\ -> C--). That's NOT always the home
# dir: a session launched with cwd C:\ gets project key "C--", not
# "C--Users-Ian". So run this script from whatever directory you actually
# launch `claude` from on this machine, and re-run it if that changes.
$memorySource = Join-Path $repoRoot "memory"
$projectKey = (Get-Location).Path -replace '[:\\/]', '-'
$memoryTarget = Join-Path $claudeDir "projects\$projectKey\memory"

New-Item -ItemType Directory -Path (Split-Path -Parent $memoryTarget) -Force | Out-Null
if (Test-Path $memoryTarget) {
    $isSymlink = (Get-Item $memoryTarget -Force).LinkType -eq "SymbolicLink"
    if ($isSymlink) {
        Remove-Item $memoryTarget -Force
    } else {
        Move-Item $memoryTarget "$memoryTarget.bak" -Force
        Write-Host "Backed up existing memory dir to memory.bak"
    }
}
try {
    New-Item -ItemType SymbolicLink -Path $memoryTarget -Target $memorySource -Force -ErrorAction Stop | Out-Null
    Write-Host "Linked memory"
} catch {
    Write-Host "FAILED to link memory : $($_.Exception.Message)" -ForegroundColor Red
}
