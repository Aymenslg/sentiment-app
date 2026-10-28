
# Script de capture d'écran automatique pour le journal TP1
# Lance chaque commande dans une fenêtre visible et capture l'écran

$proj = "c:\Users\Kassadin\Downloads\Tp1\Tp1\sentiment-app (2)\sentiment-app"
$captures = "$proj\docs\captures"

function Take-Screenshot($path) {
    Add-Type -AssemblyName System.Windows.Forms, System.Drawing
    Start-Sleep -Milliseconds 1500
    $screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
    $bmp = New-Object System.Drawing.Bitmap $screen.Width, $screen.Height
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.CopyFromScreen($screen.Location, [System.Drawing.Point]::Empty, $screen.Size)
    $bmp.Save($path)
    $g.Dispose()
    $bmp.Dispose()
    Write-Host "Screenshot saved: $path"
}

function Run-And-Screenshot($scriptBlock, $outFile) {
    $tmp = "$env:TEMP\tp1_shot_$(Get-Random).ps1"
    $scriptBlock | Out-File $tmp -Encoding utf8
    $proc = Start-Process pwsh -ArgumentList "-NoExit", "-File", $tmp -PassThru -WindowStyle Normal
    Start-Sleep -Seconds 4
    Take-Screenshot $outFile
    Start-Sleep -Seconds 1
    Stop-Process -Id $proc.Id -ErrorAction SilentlyContinue
    Remove-Item $tmp -ErrorAction SilentlyContinue
}

# --- tp0-poste-membre-b.png ---
Run-And-Screenshot @"
Set-Location '$proj'
& '.venv\Scripts\Activate.ps1'
Write-Host '--- Poste du membre B ---' -ForegroundColor Cyan
py -0
py -3.11 --version
git --version
git config --global user.name
Write-Host '--- OK ---' -ForegroundColor Green
Start-Sleep 60
"@ "$captures\tp0-poste-membre-b.png"

# --- tp1-t0-structure.png ---
Run-And-Screenshot @"
Set-Location '$proj'
& '.venv\Scripts\Activate.ps1'
Write-Host '--- Structure du kit ---' -ForegroundColor Cyan
Get-ChildItem -Force | Format-Table Name, Mode -AutoSize
Write-Host '--- OK ---' -ForegroundColor Green
Start-Sleep 60
"@ "$captures\tp1-t0-structure.png"

# --- tp1-t1-pytest.png ---
Run-And-Screenshot @"
Set-Location '$proj'
& '.venv\Scripts\Activate.ps1'
Write-Host '--- T1 : pytest de depart ---' -ForegroundColor Cyan
python --version
python -m pytest -q
Write-Host '--- FIN ---' -ForegroundColor Green
Start-Sleep 60
"@ "$captures\tp1-t1-pytest.png"

# --- tp1-t4-check-setup-b.png ---
Run-And-Screenshot @"
Set-Location '$proj'
& '.venv\Scripts\Activate.ps1'
Write-Host '--- Diagnostic membre B ---' -ForegroundColor Cyan
python scripts/check_setup.py
Write-Host '--- FIN ---' -ForegroundColor Green
Start-Sleep 60
"@ "$captures\tp1-t4-check-setup-b.png"

Write-Host "`nToutes les captures sont dans: $captures" -ForegroundColor Yellow
