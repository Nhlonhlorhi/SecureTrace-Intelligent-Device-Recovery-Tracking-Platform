# ============================================
# SecureTrace Project Runner
# ============================================

Write-Host "===========================================" -ForegroundColor Green
Write-Host "    SecureTrace - Starting Project         " -ForegroundColor Cyan
Write-Host "===========================================" -ForegroundColor Green

# Function to display progress
function Write-ProgressStep {
    param($Step, $Message)
    Write-Host "[$Step] $Message" -ForegroundColor Yellow
}

# Function to check prerequisites
function Test-Prerequisites {
    Write-ProgressStep "1" "Checking prerequisites..."
    
    # Check Java
    try {
        $javaVersion = java -version 2>&1
        if ($javaVersion -match "version") {
            Write-Host "   ? Java installed" -ForegroundColor Green
        } else {
            Write-Host "   ? Java not found" -ForegroundColor Red
            return $false
        }
    } catch {
        Write-Host "   ? Java not found" -ForegroundColor Red
        return $false
    }
    
    # Check Maven
    try {
        $mavenVersion = mvn --version 2>&1
        if ($mavenVersion -match "Apache Maven") {
            Write-Host "   ? Maven installed" -ForegroundColor Green
        } else {
            Write-Host "   ? Maven not found" -ForegroundColor Red
            return $false
        }
    } catch {
        Write-Host "   ? Maven not found" -ForegroundColor Red
        return $false
    }
    
    return $true
}

# Function to compile project
function Compile-Project {
    Write-ProgressStep "2" "Compiling project..."
    mvn clean compile
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   ? Project compiled successfully" -ForegroundColor Green
        return $true
    } else {
        Write-Host "   ? Compilation failed" -ForegroundColor Red
        return $false
    }
}

# Function to run tests
function Run-Tests {
    Write-ProgressStep "3" "Running tests..."
    mvn test
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   ? Tests passed" -ForegroundColor Green
        return $true
    } else {
        Write-Host "   ? Some tests failed (continuing anyway)" -ForegroundColor Yellow
        return $true
    }
}

# Function to run application
function Run-Application {
    Write-Host "`n" + "="*50 -ForegroundColor Cyan
    Write-Host "Starting SecureTrace Application..." -ForegroundColor Green
    Write-Host "="*50 -ForegroundColor Cyan
    
    Write-Host "`n?? Application Information:" -ForegroundColor Yellow
    Write-Host "   Port: 8080" -ForegroundColor White
    Write-Host "   Context: /api" -ForegroundColor White
    Write-Host "   Database: H2 (in-memory)" -ForegroundColor White
    Write-Host "" -ForegroundColor White
    
    Write-Host "?? Available Endpoints:" -ForegroundColor Yellow
    Write-Host "   http://localhost:8080/api/health" -ForegroundColor White
    Write-Host "   http://localhost:8080/api/welcome" -ForegroundColor White
    Write-Host "   http://localhost:8080/api/swagger-ui.html" -ForegroundColor White
    Write-Host "   http://localhost:8080/api/h2-console" -ForegroundColor White
    Write-Host "" -ForegroundColor White
    
    Write-Host "?? Starting Spring Boot application..." -ForegroundColor Green
    Write-Host "   Press Ctrl+C to stop the application" -ForegroundColor Yellow
    Write-Host "`n" + "="*50 -ForegroundColor Cyan
    
    # Run the application with progress display
    mvn spring-boot:run
}

# Function to show quick commands
function Show-QuickCommands {
    Write-Host "`n? Quick Commands:" -ForegroundColor Cyan
    Write-Host "   1. Start app: mvn spring-boot:run" -ForegroundColor Yellow
    Write-Host "   2. Build only: mvn clean package" -ForegroundColor Yellow
    Write-Host "   3. Run tests: mvn test" -ForegroundColor Yellow
    Write-Host "   4. Clean build: mvn clean install" -ForegroundColor Yellow
    Write-Host "   5. Check Git: git status" -ForegroundColor Yellow
}

# Main execution
Clear-Host

# Show banner
Write-Host "
  _____                          _____                  _      
 / ____|                        |_   _|                | |     
| (___   ___ ___ _ __   ___ _ __  | | _ __ ___ ___  ___| |___
 \___ \ / __/ _ \ '_ \ / _ \ '__| | || '__/ __/ _ \/ __| / __|
 ____) | (_|  __/ |_) |  __/ |   _| || | | (_|  __/ (__| \__ \
|_____/ \___\___| .__/ \___|_|  |_____|_|  \___\___|\___|_|___/
                | |                                            
                |_|                                            
" -ForegroundColor Cyan

Write-Host "Intelligent Device Recovery Tracking Platform`n" -ForegroundColor Green

# Check if user wants to run
$choice = Read-Host "Do you want to run the project? (Y/N)"
if ($choice -notin @('Y', 'y', 'Yes', 'yes')) {
    Show-QuickCommands
    exit
}

# Run the setup process
if (Test-Prerequisites) {
    if (Compile-Project) {
        Run-Tests
        Run-Application
    }
} else {
    Write-Host "`n? Prerequisites not met. Please install:" -ForegroundColor Red
    Write-Host "   1. Java 17 or higher" -ForegroundColor Yellow
    Write-Host "   2. Apache Maven 3.8 or higher" -ForegroundColor Yellow
    Write-Host "`nAfter installing, run this script again." -ForegroundColor Green
}
