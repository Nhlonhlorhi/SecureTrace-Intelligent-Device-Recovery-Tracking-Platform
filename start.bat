Write-Host "Starting SecureTrace..." -ForegroundColor Green
Write-Host "Project will be available at:" -ForegroundColor Yellow
Write-Host "  • http://localhost:8080/api/health" -ForegroundColor White
Write-Host "  • http://localhost:8080/api/swagger-ui.html" -ForegroundColor White
Write-Host "`nBuilding and running..." -ForegroundColor Cyan

# Run Maven with visible progress
mvn clean spring-boot:run
