# SecureTrace Development Helper Script

function Show-SecureTraceMenu {
    Write-Host "`n=== SecureTrace Development Menu ===" -ForegroundColor Cyan
    Write-Host "1. Start Application (Maven)" -ForegroundColor Yellow
    Write-Host "2. Run Tests" -ForegroundColor Yellow
    Write-Host "3. Check Git Status" -ForegroundColor Yellow
    Write-Host "4. Pull Latest Changes" -ForegroundColor Yellow
    Write-Host "5. Push Changes" -ForegroundColor Yellow
    Write-Host "6. Build Project" -ForegroundColor Yellow
    Write-Host "7. Open in VS Code" -ForegroundColor Yellow
    Write-Host "8. Show Project Status" -ForegroundColor Yellow
    Write-Host "9. Exit" -ForegroundColor Red
    Write-Host "====================================" -ForegroundColor Cyan
}

function Start-SecureTraceApp {
    Write-Host "`n[1/5] Checking Maven..." -ForegroundColor Green
    mvn --version
    
    Write-Host "`n[2/5] Cleaning project..." -ForegroundColor Green
    mvn clean
    
    Write-Host "`n[3/5] Installing dependencies..." -ForegroundColor Green
    mvn install -DskipTests
    
    Write-Host "`n[4/5] Starting SecureTrace application..." -ForegroundColor Green
    Write-Host "Application will be available at: http://localhost:8080" -ForegroundColor Yellow
    Write-Host "Press Ctrl+C to stop" -ForegroundColor Yellow
    
    mvn spring-boot:run
}

function Test-SecureTraceProject {
    Write-Host "`nRunning SecureTrace tests..." -ForegroundColor Green
    mvn test
}

function Get-SecureTraceGitStatus {
    Write-Host "`n=== Git Status ===" -ForegroundColor Green
    git status
    Write-Host "`n=== Recent Commits ===" -ForegroundColor Green
    git log --oneline -5
}

function Update-SecureTraceFromGit {
    Write-Host "`nPulling latest changes from GitHub..." -ForegroundColor Green
    git pull origin main
}

function Push-SecureTraceToGit {
    Write-Host "`n=== Git Add & Commit ===" -ForegroundColor Green
    git add .
    
    $commitMessage = Read-Host "Enter commit message"
    if ($commitMessage) {
        git commit -m $commitMessage
        Write-Host "`n=== Pushing to GitHub ===" -ForegroundColor Green
        git push origin main
        Write-Host "Changes pushed successfully!" -ForegroundColor Green
    } else {
        Write-Host "Commit cancelled." -ForegroundColor Yellow
    }
}

function Build-SecureTraceProject {
    Write-Host "`nBuilding SecureTrace project..." -ForegroundColor Green
    mvn clean package
    Write-Host "`nBuild completed!" -ForegroundColor Green
    Write-Host "JAR file: target/securetrace-backend-1.0.0-SNAPSHOT.jar" -ForegroundColor Yellow
}

function Open-SecureTraceInVSCode {
    Write-Host "`nOpening SecureTrace in VS Code..." -ForegroundColor Green
    if (Get-Command code -ErrorAction SilentlyContinue) {
        code .
    } else {
        Write-Host "VS Code 'code' command not found." -ForegroundColor Red
        Write-Host "Please open VS Code and open this folder manually." -ForegroundColor Yellow
        Write-Host "Current path: $(Get-Location)" -ForegroundColor Yellow
    }
}

function Show-SecureTraceStatus {
    Write-Host "`n=== SecureTrace Project Status ===" -ForegroundColor Cyan
    Write-Host "Project: SecureTrace-Intelligent-Device-Recovery-Tracking-Platform" -ForegroundColor Yellow
    Write-Host "Location: $(Get-Location)" -ForegroundColor Yellow
    Write-Host "`n=== Java Environment ===" -ForegroundColor Green
    java -version 2>&1 | Select-String "version"
    Write-Host "`n=== Maven Environment ===" -ForegroundColor Green
    mvn --version 2>&1 | Select-String "Apache Maven"
    Write-Host "`n=== Git Status ===" -ForegroundColor Green
    git status --short
    Write-Host "`n=== Important Files ===" -ForegroundColor Green
    Get-ChildItem -File pom.xml, README.md, .gitignore -ErrorAction SilentlyContinue | Select-Object Name, Length, LastWriteTime
}

# Main execution
Clear-Host
Write-Host "===========================================" -ForegroundColor Green
Write-Host "    SecureTrace Development Environment    " -ForegroundColor Cyan
Write-Host "===========================================" -ForegroundColor Green

# Check if we're in the right directory
$currentDir = Get-Location
if ($currentDir -notmatch "SecureTrace") {
    Write-Host "Warning: You may not be in the SecureTrace project directory." -ForegroundColor Yellow
    Write-Host "Current directory: $currentDir" -ForegroundColor Yellow
}

do {
    Show-SecureTraceMenu
    $choice = Read-Host "`nSelect an option (1-9)"
    
    switch ($choice) {
        "1" { Start-SecureTraceApp }
        "2" { Test-SecureTraceProject }
        "3" { Get-SecureTraceGitStatus }
        "4" { Update-SecureTraceFromGit }
        "5" { Push-SecureTraceToGit }
        "6" { Build-SecureTraceProject }
        "7" { Open-SecureTraceInVSCode }
        "8" { Show-SecureTraceStatus }
        "9" { 
            Write-Host "`nExiting SecureTrace Development Helper. Goodbye!" -ForegroundColor Green
            exit 0 
        }
        default { Write-Host "Invalid option. Please select 1-9." -ForegroundColor Red }
    }
    
    if ($choice -ne "1") {
        Write-Host "`nPress Enter to continue..." -ForegroundColor Gray
        Read-Host
        Clear-Host
    }
} while ($true)
