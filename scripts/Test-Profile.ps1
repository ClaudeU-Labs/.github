[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$profilePath = Join-Path $repoRoot 'profile/README.md'
$failures = [System.Collections.Generic.List[string]]::new()

function Add-Failure {
    param([Parameter(Mandatory)][string]$Message)
    $failures.Add($Message)
}

$requiredFiles = @(
    'profile/README.md',
    'README.md',
    'LICENSE',
    'NOTICE.md',
    'CONTRIBUTING.md',
    'SECURITY.md',
    'SUPPORT.md'
)

foreach ($relative in $requiredFiles) {
    if (-not (Test-Path -LiteralPath (Join-Path $repoRoot $relative))) {
        Add-Failure "Missing required file: $relative"
    }
}

$profile = Get-Content -Raw -Encoding UTF8 -LiteralPath $profilePath
foreach ($requiredText in @(
    'https://github.com/ClaudeU-Labs/claude-desktop-doctor',
    'https://github.com/ClaudeU-Labs/claude-desktop-windows-guide',
    'https://github.com/ClaudeU-Labs/claude-mcp-starter-cn',
    'https://github.com/ClaudeU-Labs/claude-code-windows-guide',
    'https://github.com/ClaudeU-Labs/claude-code-cost-guide-cn',
    'utm_campaign=claudeu-labs&utm_content=profile-hero',
    'utm_campaign=claudeu-labs&utm_content=profile-path-product',
    'utm_campaign=claudeu-labs&utm_content=profile-footer',
    'complete ClaudeU Desktop product remains proprietary'
)) {
    if ($profile -notmatch [regex]::Escape($requiredText)) {
        Add-Failure "Organization profile is missing required text: $requiredText"
    }
}

$textFiles = Get-ChildItem -LiteralPath $repoRoot -Recurse -File |
    Where-Object Extension -eq '.md'

foreach ($file in $textFiles) {
    $content = Get-Content -Raw -Encoding UTF8 -LiteralPath $file.FullName
    $relative = $file.FullName.Substring($repoRoot.Length).TrimStart([char[]]'\/')

    if ($content -match 'https://claudeu\.com/(?:[a-z]{2}-[A-Z]{2}/)?(?:download|guide)(?:[/?#])') {
        Add-Failure "$relative links to a retired ClaudeU campaign landing path."
    }

    $claudeuLinks = [regex]::Matches($content, 'https://claudeu\.com/[^\s)>"'']*')
    foreach ($claudeuLink in $claudeuLinks) {
        $url = $claudeuLink.Value.TrimEnd('.', ',', ';')
        $isTrackedHomepage = $url -match '^https://claudeu\.com/\?utm_source=github&utm_medium=organic&utm_campaign=claudeu-labs&utm_content=[a-z0-9-]+$'
        if (-not $isTrackedHomepage) {
            Add-Failure "$relative contains an unsupported ClaudeU destination: $url"
        }
    }

    $links = [regex]::Matches($content, '(?<!\!)\[[^\]]+\]\(([^)]+)\)')
    foreach ($link in $links) {
        $target = $link.Groups[1].Value.Trim().Trim('<', '>')
        if ($target -match '^(?:https?://|mailto:|#)') {
            continue
        }

        $pathOnly = ($target -split '[?#]', 2)[0]
        if ([string]::IsNullOrWhiteSpace($pathOnly)) {
            continue
        }

        $resolvedTarget = [IO.Path]::GetFullPath((Join-Path $file.DirectoryName $pathOnly))
        if (-not $resolvedTarget.StartsWith($repoRoot, [StringComparison]::OrdinalIgnoreCase)) {
            Add-Failure "$relative contains a link outside the repository: $target"
        }
        elseif (-not (Test-Path -LiteralPath $resolvedTarget)) {
            Add-Failure "$relative contains a broken relative link: $target"
        }
    }
}

if ($failures.Count -gt 0) {
    Write-Host "Profile checks failed ($($failures.Count)):" -ForegroundColor Red
    foreach ($failure in $failures) {
        Write-Host " - $failure" -ForegroundColor Red
    }
    exit 1
}

Write-Host 'Profile checks passed.' -ForegroundColor Green
Write-Host "Checked $($textFiles.Count) Markdown files."
