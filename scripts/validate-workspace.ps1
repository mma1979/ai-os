param(
    [switch]$Sync
)

$ErrorActionPreference = 'Stop'
$root = 'd:\workspaces\agents'
$skillsDir = Join-Path $root 'skills'
$personasDir = Join-Path $root 'personas'
$opencodeAgents = 'C:\Users\mma_7\.config\opencode\agents'
$skillsMirrorAgentsMd = 'D:\workspaces\skills\AGENTS.md'

Write-Host '=== 1. PARSING PERSONAS & META SKILLS ==='
$personaFiles = Get-ChildItem $personasDir -Filter '*.md' | Where-Object { $_.Name -ne 'README.md' }
$skillToPersonas = @{}
$personaCounts = @{}

foreach ($pf in $personaFiles) {
    $raw = Get-Content $pf.FullName -Raw
    if ($raw -match '(?s)## Skills(.*?)## When to spawn') {
        $block = $Matches[1]
        # Only match the primary slug (not the folder name in parentheses)
        # In our format: `slug` or `slug` (`folder`)
        $cleanBlock = [regex]::Replace($block, '\(`[^`]+`\)', '')
        $slugs = @()
        foreach ($m in [regex]::Matches($cleanBlock, '`([a-z0-9-]+)`')) {
            $s = $m.Groups[1].Value
            $slugs += $s
            if (-not $skillToPersonas.ContainsKey($s)) { $skillToPersonas[$s] = @() }
            $skillToPersonas[$s] += $pf.BaseName
        }
        $personaCounts[$pf.BaseName] = $slugs.Count
        Write-Host ("  Persona " + $pf.BaseName + ": " + $slugs.Count + " skills")
    }
}

$readmeRaw = Get-Content (Join-Path $personasDir 'README.md') -Raw
$metaSkills = @()
if ($readmeRaw -match '(?s)## Meta skills.*?\r?\n(.*?)## Skill sources') {
    $metaBlock = [regex]::Replace($Matches[1], '\(`[^`]+`\)', '')
    foreach ($m in [regex]::Matches($metaBlock, '`([a-z0-9-]+)`')) {
        $ms = $m.Groups[1].Value
        $metaSkills += $ms
        if (-not $skillToPersonas.ContainsKey($ms)) { $skillToPersonas[$ms] = @() }
        $skillToPersonas[$ms] += 'meta'
    }
}
Write-Host ("  Meta skills: " + $metaSkills.Count)

Write-Host '=== 2. SCANNING ALL 158 SKILL FOLDERS ==='
$skillFolders = Get-ChildItem $skillsDir -Directory | Sort-Object Name
$indexEntries = @()
$errors = @()
$brokenLinks = @()

foreach ($f in $skillFolders) {
    $md = Join-Path $f.FullName 'SKILL.md'
    if (-not (Test-Path $md)) {
        $errors += ("Missing SKILL.md in folder: " + $f.Name)
        continue
    }
    $raw = Get-Content $md -Raw
    $lines = Get-Content $md
    $slug = $f.Name
    if ($raw -match '(?m)^name:\s*(.+)$') {
        $slug = $Matches[1].Trim().Trim('"').Trim("'")
    } else {
        $errors += ("Missing frontmatter name in: " + $f.Name)
    }
    if ($raw -notmatch '(?m)^description:') {
        $errors += ("Missing frontmatter description in: " + $f.Name)
    }

    # Extract short 1-line summary from description
    $descText = ''
    if ($raw -match '(?s)^---\r?\n(.*?)\r?\n---') {
        $fm = $Matches[1]
        if ($fm -match '(?ms)^description:\s*[>|+-]*\s*(.+?)(?=\r?\n[a-zA-Z0-9_-]+:|\z)') {
            $descText = ($Matches[1] -replace '\r?\n', ' ' -replace '\s+', ' ').Trim().Trim('"').Trim("'")
            if ($descText.Length -gt 140) {
                $descText = $descText.Substring(0, 137) + '...'
            }
        }
    }

    $owners = if ($skillToPersonas.ContainsKey($slug)) { $skillToPersonas[$slug] } elseif ($skillToPersonas.ContainsKey($f.Name)) { $skillToPersonas[$f.Name] } else { @() }
    if ($owners.Count -eq 0) {
        $errors += ("Unmapped skill on disk: folder='" + $f.Name + "', slug='" + $slug + "'")
    }

    # Check relative links inside SKILL.md (outside fenced code blocks and inline code)
    $rawNoCode = [regex]::Replace($raw, '(?s)```.*?```', '')
    $rawNoCode = [regex]::Replace($rawNoCode, '`[^`]+`', '')
    foreach ($l in [regex]::Matches($rawNoCode, '\[([^\]]+)\]\(([^)]+)\)')) {
        $target = $l.Groups[2].Value.Trim()
        if ($target -notmatch '^(https?:|mailto:|#|\$|\{)') {
            $cleanTarget = ($target -split '#')[0]
            if ($cleanTarget -and $cleanTarget -notmatch '^/') {
                $fullTarget = [System.IO.Path]::GetFullPath((Join-Path $f.FullName $cleanTarget))
                if (-not [System.IO.File]::Exists($fullTarget) -and -not [System.IO.Directory]::Exists($fullTarget)) {
                    $brokenLinks += [PSCustomObject]@{ Skill = $f.Name; Link = $target }
                }
            }
        }
    }

    $indexEntries += [ordered]@{
        slug = $slug
        folder = $f.Name
        path = ("skills/" + $f.Name + "/SKILL.md")
        personas = $owners
        lines = $lines.Count
        summary = $descText
    }
}

# Write personas/skill-index.json
$jsonPath = Join-Path $personasDir 'skill-index.json'
$indexObj = [ordered]@{
    generated_at = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
    total_skills = $indexEntries.Count
    skills = $indexEntries
}
$indexObj | ConvertTo-Json -Depth 5 | Set-Content -Path $jsonPath -Encoding UTF8
Write-Host ("  Wrote " + $jsonPath + " (" + $indexEntries.Count + " skills)")

# Write skills/0xdarkmatter-tool-discovery/references/skills-catalog.md
$catLines = @(
    '# Workspace Skills Catalog (Auto-Generated)',
    '',
    ('Total installed skills: **' + $indexEntries.Count + '**'),
    '',
    '| Slug (`name`) | Folder (`skills/<folder>`) | Persona / Scope | Summary |',
    '|---|---|---|---|'
)
foreach ($e in ($indexEntries | Sort-Object { $_.slug })) {
    $pStr = ($e.personas -join ', ')
    $safeSum = $e.summary -replace '\|', '\|'
    $catLines += ('| `' + $e.slug + '` | `' + $e.folder + '` | `' + $pStr + '` | ' + $safeSum + ' |')
}
$catPath = Join-Path $skillsDir '0xdarkmatter-tool-discovery\references\skills-catalog.md'
$catLines -join "`r`n" | Set-Content -Path $catPath -Encoding UTF8
Write-Host ("  Wrote " + $catPath)

# Write skills/0xdarkmatter-tool-discovery/reference.md as a compact pointer
$refPointer = @(
    '# Tool Discovery Reference',
    '',
    '- Full Persona & Subagent Catalog: [references/agents-catalog.md](references/agents-catalog.md)',
    '- Full 158-Skill Catalog: [references/skills-catalog.md](references/skills-catalog.md)',
    '- Machine-Readable Index: [../../personas/skill-index.json](../../personas/skill-index.json)'
) -join "`r`n"
$refPointer | Set-Content -Path (Join-Path $skillsDir '0xdarkmatter-tool-discovery\reference.md') -Encoding UTF8

if ($Sync) {
    Write-Host '=== 3. SYNCING MIRRORS ==='
    if (Test-Path $opencodeAgents) {
        Get-ChildItem $personasDir -Filter '*.md' | Where-Object { $_.Name -ne 'README.md' } | ForEach-Object {
            Copy-Item $_.FullName (Join-Path $opencodeAgents $_.Name) -Force
        }
        Write-Host ("  Synced 13 persona/subagent files to " + $opencodeAgents)
    }
    if (Test-Path (Split-Path $skillsMirrorAgentsMd -Parent)) {
        Copy-Item (Join-Path $root 'AGENTS.md') $skillsMirrorAgentsMd -Force
        Write-Host ("  Synced AGENTS.md to " + $skillsMirrorAgentsMd)
    }
}

Write-Host '=== 4. VALIDATION SUMMARY ==='
Write-Host ("  Total Skills Indexed: " + $indexEntries.Count)
Write-Host ("  Mapping/Frontmatter Errors: " + $errors.Count)
if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Host ("    ERROR: " + $_) }
}
Write-Host ("  Broken Relative Markdown Links (outside code blocks): " + $brokenLinks.Count)
if ($brokenLinks.Count -gt 0) {
    $brokenLinks | Format-Table -AutoSize
}

if ($errors.Count -gt 0 -or $brokenLinks.Count -gt 0) {
    exit 1
}
Write-Host 'PASS: Workspace skills, personas, and links are 100% valid.'
