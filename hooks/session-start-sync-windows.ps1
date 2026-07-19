# SessionStart hook: memory-bank doctor + cross-machine branch sync.
# Windows counterpart of session-start-sync-mac.sh (invoked via powershell,
# which the Mac lacks, so it self-selects by platform the same way the
# notify hooks do). Prints [memory-bank] lines into session context and
# always exits 0: a broken check must never block a session, visibility is
# the point.

$candidates = @(
    (Join-Path $HOME 'claude\claude-memory-bank'),
    (Join-Path $HOME 'claude-memory-bank')
)
$repo = $null
foreach ($c in $candidates) {
    if (Test-Path (Join-Path $c '.git')) { $repo = $c; break }
}
if (-not $repo) {
    Write-Output "[memory-bank] DOCTOR: repo not found at any known path ($($candidates -join ', ')). It moved again: update hooks/session-start-sync-*.* and re-run install/windows.ps1."
    exit 0
}

# 1. The project-key memory link must resolve into this repo, or memory
# writes land nowhere (exactly what happened 2026-07-19 after a repo move).
$projectKey = (Get-Location).Path -replace '[:\\/]', '-'
$memoryLink = Join-Path $HOME ".claude\projects\$projectKey\memory"
$expected = Join-Path $repo 'memory'
$item = Get-Item $memoryLink -Force -ErrorAction SilentlyContinue
if (-not $item) {
    Write-Output "[memory-bank] DOCTOR: no memory link at $memoryLink, memory writes are landing nowhere. Recreate it: cmd /c mklink /J `"$memoryLink`" `"$expected`""
} elseif (-not $item.LinkType) {
    Write-Output "[memory-bank] DOCTOR: $memoryLink is a real directory, not a link into the repo, so memories are not syncing. Merge its contents into $expected, then replace it with a junction (mklink /J)."
} else {
    $target = @($item.Target)[0]
    if ($target -ne $expected) {
        Write-Output "[memory-bank] DOCTOR: memory link points at $target, expected $expected. Re-point it: cmd /c rmdir `"$memoryLink`" && cmd /c mklink /J `"$memoryLink`" `"$expected`""
    }
}

# 2. This machine lives on the windows branch, permanently.
$branch = git -C $repo rev-parse --abbrev-ref HEAD
if ($branch -ne 'windows') {
    Write-Output "[memory-bank] DOCTOR: checkout is on '$branch', expected 'windows'. Switch back: git -C `"$repo`" switch windows"
    exit 0
}

git -C $repo fetch origin --quiet 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Output '[memory-bank] fetch failed (offline?), working from local state, possibly stale.'
    exit 0
}

# 3. Leftovers from a previous session (SessionEnd stages, never commits).
$dirty = git -C $repo status --porcelain
if ($dirty) {
    Write-Output '[memory-bank] Uncommitted changes left from a previous session. Commit them now (draft the message from the diff), then push.'
}

# 4. Converge: merge the other machine's branch (and legacy master while the
# transition lasts). Conflicts are deliberately left in the worktree for
# Claude to resolve immediately.
foreach ($other in @('origin/mac', 'origin/master')) {
    git -C $repo rev-parse --verify --quiet $other *> $null
    if ($LASTEXITCODE -ne 0) { continue }
    $behind = [int](git -C $repo rev-list --count "HEAD..$other")
    if ($behind -eq 0) { continue }
    if ($dirty) {
        Write-Output "[memory-bank] $other has $behind commit(s) not merged here. After committing the local changes above, run: git -C `"$repo`" merge --no-edit $other"
        continue
    }
    git -C $repo merge --no-edit $other *> $null
    if ($LASTEXITCODE -eq 0) {
        Write-Output "[memory-bank] merged $behind commit(s) from $other."
    } else {
        Write-Output "[memory-bank] MERGE CONFLICT with $other. Resolve it in $repo before any other work: keep both sides' facts, dedupe MEMORY.md, commit, push."
    }
}

# 5. Anything unpushed, including merges just made.
git -C $repo rev-parse --verify --quiet origin/windows *> $null
if ($LASTEXITCODE -eq 0) {
    $ahead = [int](git -C $repo rev-list --count 'origin/windows..HEAD')
    if ($ahead -gt 0) {
        Write-Output "[memory-bank] $ahead unpushed commit(s) on windows. Push: git -C `"$repo`" push"
    }
} else {
    Write-Output "[memory-bank] branch windows has no upstream yet. Push: git -C `"$repo`" push -u origin windows"
}

exit 0
