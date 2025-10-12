# :: installer for Windows PowerShell ::
# requirements: PowerShell >= 5.1
# uninstall: $env:ARG="--uninstall"; iwr -useb https://williamcanin.github.io/install.ps1 | iex

$ScriptName = Split-Path -Leaf $MyInvocation.MyCommand.Path
$ThemeName  = "rawfeed"

function Msg-Reply ($msg) {
    Write-Host "→ $msg" -ForegroundColor Cyan -NoNewline
}

function Msg-Header ($msg) {
    Write-Host "→ $msg" -ForegroundColor Cyan
}

function Msg-Finish ($msg) {
    Write-Host "✔ $msg" -ForegroundColor Green
}

function Msg-Warning ($msg) {
    Write-Host "⚠ $msg" -ForegroundColor Yellow
}

function Msg-Error ($msg) {
    Write-Host "✖ $msg" -ForegroundColor Red
    exit 1
}

function Check-User {
    $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $isAdmin = (New-Object Security.Principal.WindowsPrincipal $currentUser).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    if ($isAdmin) {
        Msg-Error "You cannot use this feature as Administrator."
    }
}

function Check-Dir {
    $files = Get-ChildItem -Force | Where-Object { $_.Name -ne $ScriptName }
    if ($files.Count -gt 0) {
        Msg-Error "The current directory is not empty. The installation must be performed in an empty directory."
    }
}

function Check-Dependencies {
    $deps = @("ruby", "git", "gem", "npm")
    foreach ($dep in $deps) {
        if (-not (Get-Command $dep -ErrorAction SilentlyContinue)) {
            Msg-Error "$dep not found. Please install $dep!"
        }
    }
}

function Gem-Bundle-Install {
    Msg-Header "Installing dependencies from `"$ThemeName`"..."
    if (Test-Path "Gemfile") {
        gem install bundler
        bundle install
    } else {
        Msg-Error "Gemfile file not found. Aborted!"
    }
    Msg-Finish "$ThemeName dependencies installed!"
}

function Npm-Install {
    Msg-Header "Installing optimization dependencies (node_modules)..."
    if (Test-Path "package.json") {
        npm install
    } else {
        Msg-Error "Package.json file not found. Aborted!"
    }
    Msg-Finish "Optimization dependencies installed!"
}

function Starter {
    Msg-Header "Creating a `"$ThemeName`" template..."

    git clone -b main --single-branch "https://github.com/williamcanin/$ThemeName.git"

    $source = Join-Path $ThemeName "tools/starter"
    Copy-Item "$source\*" . -Recurse -Force
    Remove-Item -Recurse -Force $ThemeName

    Msg-Reply "Enter your website's hostname and protocol [E.g.: https://yoursite.com]: "
    $url = Read-Host

    (Get-Content "_config.yml") -replace '^url: .*', "url: `"$url`"" | Set-Content "_config.yml"
    (Get-Content "CNAME") -replace 'site', "$url" | Set-Content "CNAME"
    (Get-Content "README.md") -replace '# site', "# $url" | Set-Content "README.md"

    Msg-Finish "$ThemeName template created!"
}

function Choice-CI {
    while ($true) {
        Msg-Reply "Which CI/CD do you use?`n"
        Write-Host "1 - GitHub"
        Write-Host "2 - GitLab"
        Write-Host "3 - Both"
        Write-Host "4 - Neither"
        $reply = Read-Host ">"

        switch ($reply) {
            "1" { Remove-Item ".gitlab-ci.yml" -ErrorAction SilentlyContinue; break }
            "2" { Remove-Item ".github" -Recurse -Force -ErrorAction SilentlyContinue; break }
            "3" { break }
            "4" { Remove-Item ".github",".gitlab-ci.yml" -Recurse -Force -ErrorAction SilentlyContinue; break }
            default { Msg-Warning "Invalid option: $reply. Please enter 1, 2, 3 or 4." }
        }
    }
    Msg-Finish "CI/CD setup complete!"
}

function Show-Menu {
    npm run help
    Msg-Warning "Configure the '_config.yml' file as you like."
    Msg-Warning "For more information, read: README.md"
}

function Main {
    Check-User
    Check-Dir
    Check-Dependencies
    Starter
    Gem-Bundle-Install
    Choice-CI
    Npm-Install
    Show-Menu
}

param(
    [string]$Action
)

switch ($Action) {
    "--uninstall" {
        Msg-Header "Uninstallation..."
        Get-ChildItem -Force | Where-Object { $_.Name -ne $ScriptName } | Remove-Item -Recurse -Force
        Msg-Finish "Uninstallation complete!"
    }
    default {
        Main
    }
}

exit 0
