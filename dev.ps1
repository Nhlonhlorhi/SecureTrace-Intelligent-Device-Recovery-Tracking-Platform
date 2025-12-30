# SecureTrace Development Helper Script

Write-Host "=== SecureTrace Development Commands ===" -ForegroundColor Green

function Show-Menu {
    Clear-Host
    Write-Host "================ SecureTrace ================" -ForegroundColor Cyan
    Write-Host "1. Start Application (Maven)" -ForegroundColor Yellow
    Write-Host "2. Run Tests" -ForegroundColor Yellow
    Write-Host "3. Check Git Status" -ForegroundColor Yellow
    Write-Host "4. Pull Latest Changes" -ForegroundColor Yellow
    Write-Host "5. Push Changes" -ForegroundColor Yellow
    Write-Host "6. Build Project" -ForegroundColor Yellow
    Write-Host "7. Docker Compose Up" -ForegroundColor Yellow
    Write-Host "8. Open in VS Code" -ForegroundColor Yellow
    Write-Host "Q. Quit" -ForegroundColor Red
    Write-Host "============================================" -ForegroundColor Cyan
}

function Start-App {
    Write-Host "
Starting SecureTrace application..." -ForegroundColor Green
    mvn spring-boot:run
}

function Run-Tests {
    Write-Host "
Running tests..." -ForegroundColor Green
    mvn test
}

function Git-Status {
    Write-Host "
Git Status:" -ForegroundColor Green
    git status
}

function Git-Pull {
    Write-Host "
Pulling latest changes..." -ForegroundColor Green
    git pull origin main
}

function Git-Push {
    Write-Host "
Pushing changes..." -ForegroundColor Green
    git add .
     = Read-Host "Enter commit message"
    git commit -m "$message"
    git push origin main
}

function Build-Project {
    Write-Host "
Building project..." -ForegroundColor Green
    mvn clean package
}

function Docker-Up {
    Write-Host "
Starting Docker services..." -ForegroundColor Green
    docker-compose up -d
}

function Open-VSCode {
    Write-Host "
Opening in VS Code..." -ForegroundColor Green
    code .
}

# Main menu loop
do {
    Show-Menu
     = Read-Host "
Please choose an option"
    
    switch () {
        '1' { Start-App }
        '2' { Run-Tests }
        '3' { Git-Status }
        '4' { Git-Pull }
        '5' { Git-Push }
        '6' { Build-Project }
        '7' { Docker-Up }
        '8' { Open-VSCode }
        'q' { Write-Host "Goodbye!" -ForegroundColor Green; exit }
        default { Write-Host "Invalid option" -ForegroundColor Red }
    }
    
    if ( -ne 'q') {
        Read-Host "
Press Enter to continue"
    }
} while ( -ne 'q')
