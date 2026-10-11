<#
.SYNOPSIS
  Двусторонняя синхронизация локальной копии базы знаний с GitHub.

.DESCRIPTION
  1. Коммитит все локальные изменения (например, новые файлы в raw/).
  2. Забирает изменения с GitHub (git pull --rebase).
  3. Отправляет локальные коммиты на GitHub (git push).
  При конфликте ничего не затирает: откатывает rebase, оставляет ваш коммит
  локально и просит разрешить конфликт в GitHub Desktop.

.PARAMETER Quiet
  Режим для планировщика: без вывода на экран и без паузы в конце.
  Всё пишется в sync.log в корне репозитория.
#>
param([switch]$Quiet)

$RepoRoot = Split-Path -Parent $PSScriptRoot
$LogFile  = Join-Path $RepoRoot 'sync.log'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

if ($Quiet) {
    # В фоне некому ответить на запрос пароля — пусть git сразу падает, а не висит.
    $env:GIT_TERMINAL_PROMPT = '0'
    $env:GCM_INTERACTIVE = 'never'
}

function Write-Log([string]$Message, [string]$Color = 'Gray') {
    $line = '{0:yyyy-MM-dd HH:mm:ss}  {1}' -f (Get-Date), $Message
    Add-Content -Path $LogFile -Value $line -Encoding UTF8
    if (-not $Quiet) { Write-Host $Message -ForegroundColor $Color }
}

function Invoke-Git {
    $output = & git -c core.quotepath=false @args 2>&1
    $code = $LASTEXITCODE
    foreach ($line in $output) {
        $text = ("$line" -replace '\x1b\[[0-9;]*[A-Za-z]', '').TrimEnd()
        if ($text -and $text -ne 'System.Management.Automation.RemoteException') { Write-Log "  $text" }
    }
    return $code
}

function Finish([int]$Code) {
    if (-not $Quiet) {
        Write-Host ''
        Read-Host 'Нажмите Enter, чтобы закрыть' | Out-Null
    }
    exit $Code
}

function Fail([string]$Message) {
    Write-Log "ОШИБКА: $Message" 'Red'
    Finish 1
}

# Не даём логу расти бесконечно.
if ((Test-Path $LogFile) -and (Get-Item $LogFile).Length -gt 1MB) {
    $tail = Get-Content $LogFile -Tail 2000 -Encoding UTF8
    Set-Content -Path $LogFile -Value $tail -Encoding UTF8
}

Write-Log '=== Синхронизация ===' 'Cyan'

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Fail 'Git не найден. Установите Git for Windows: winget install --id Git.Git -e (GitHub Desktop свой git в PATH не добавляет).'
}

Set-Location $RepoRoot
$gitDir = & git rev-parse --git-dir 2>$null
if ($LASTEXITCODE -ne 0) { Fail "Папка $RepoRoot не является git-репозиторием." }

foreach ($marker in 'rebase-merge', 'rebase-apply', 'MERGE_HEAD') {
    if (Test-Path (Join-Path $gitDir $marker)) {
        Fail 'Есть незавершённое слияние или rebase. Откройте репозиторий в GitHub Desktop и разрешите конфликт.'
    }
}

$branch = (& git rev-parse --abbrev-ref HEAD 2>$null)
if ($LASTEXITCODE -ne 0 -or $branch -eq 'HEAD') { Fail 'Не удалось определить текущую ветку.' }
Write-Log "Ветка: $branch"

if (-not (& git config user.email)) {
    Fail 'Не задан автор коммитов. Откройте GitHub Desktop → File → Options → Git и заполните имя и e-mail.'
}

# 1. Локальные изменения → коммит.
if ((Invoke-Git add -A) -ne 0) { Fail 'git add не удался.' }
& git diff --cached --quiet
if ($LASTEXITCODE -ne 0) {
    $message = 'Sync from {0}: {1:yyyy-MM-dd HH:mm}' -f [Environment]::MachineName, (Get-Date)
    if ((Invoke-Git commit -m $message) -ne 0) { Fail 'git commit не удался.' }
    Write-Log "Закоммичены локальные изменения: $message" 'Green'
} else {
    Write-Log 'Локальных изменений нет.'
}

# 2. Изменения с GitHub.
if ((Invoke-Git fetch origin) -ne 0) {
    Fail 'Не удалось связаться с GitHub (нет сети или не выполнен вход). Запустите sync.cmd вручную, чтобы войти.'
}

$before = & git rev-parse HEAD
& git rev-parse --verify --quiet "refs/remotes/origin/$branch" | Out-Null
$remoteExists = ($LASTEXITCODE -eq 0)

if ($remoteExists) {
    if ((Invoke-Git pull --rebase origin $branch) -ne 0) {
        Invoke-Git rebase --abort | Out-Null
        Fail ('Конфликт: одни и те же файлы изменены и у вас, и на GitHub. ' +
              'Ваши изменения сохранены в локальном коммите, ничего не потеряно. ' +
              'Откройте GitHub Desktop → Pull origin и разрешите конфликт.')
    }
    $pulled = [int](& git rev-list --count "$before..origin/$branch")
    if ($pulled -gt 0) {
        Write-Log "Получено с GitHub коммитов: $pulled" 'Green'
    } else {
        Write-Log 'С GitHub нового ничего.'
    }
}

# 3. Локальные коммиты → GitHub.
if ($remoteExists) {
    $ahead = [int](& git rev-list --count "origin/$branch..HEAD")
} else {
    $ahead = 1
}
if ($ahead -gt 0) {
    if ((Invoke-Git push -u origin $branch) -ne 0) {
        Fail 'git push не удался. Попробуйте ещё раз через минуту; если повторяется — откройте GitHub Desktop.'
    }
    Write-Log "Отправлено на GitHub коммитов: $ahead" 'Green'
} else {
    Write-Log 'Отправлять нечего.'
}

Write-Log 'Готово: локальная копия и GitHub синхронны.' 'Cyan'
Finish 0
