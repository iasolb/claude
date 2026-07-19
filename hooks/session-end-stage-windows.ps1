# SessionEnd hook: stage (never commit or push) any pending changes in the
# personal claude-memory-bank repo, and notify if anything got staged.

# The repo has moved before; check known locations, newest first.
$repo = $null
foreach ($c in @((Join-Path $HOME "claude\claude-memory-bank"), (Join-Path $HOME "claude-memory-bank"))) {
    if (Test-Path (Join-Path $c ".git")) { $repo = $c; break }
}
if (-not $repo) {
    exit 0
}

Push-Location $repo
git add -A
$staged = git diff --cached --name-only
Pop-Location

if (-not $staged) {
    exit 0
}

Add-Type -AssemblyName System.Windows.Forms
$notify = New-Object System.Windows.Forms.NotifyIcon
$notify.Icon = [System.Drawing.SystemIcons]::Information
$notify.Visible = $true
$notify.BalloonTipTitle = "Claude Code"
$notify.BalloonTipText = "Changes staged in claude-memory-bank, ready to review"
$notify.ShowBalloonTip(4000)
Start-Sleep -Seconds 3
$notify.Dispose()
