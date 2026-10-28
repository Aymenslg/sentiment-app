# ================================================================
# Script pour prendre les captures manquantes du journal TP1
# Lancez ce script dans un terminal VISIBLE (pas en arriere-plan)
# ================================================================

$proj = "c:\Users\Kassadin\Downloads\Tp1\Tp1\sentiment-app (2)\sentiment-app"
Set-Location $proj
& ".venv\Scripts\Activate.ps1"

function Capture-Ecran($fichier) {
    Add-Type -AssemblyName System.Windows.Forms, System.Drawing
    $screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
    $bmp = New-Object System.Drawing.Bitmap $screen.Width, $screen.Height
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.CopyFromScreen($screen.Location, [System.Drawing.Point]::Empty, $screen.Size)
    $bmp.Save($fichier)
    $g.Dispose(); $bmp.Dispose()
    Write-Host "  -> Capture : $fichier" -ForegroundColor Green
}

Write-Host ""
Write-Host "=== CAPTURE 1 : check_setup (tp1-t4-check-setup-b.png) ===" -ForegroundColor Cyan
python scripts/check_setup.py
Start-Sleep 1
Capture-Ecran "$proj\docs\captures\tp1-t4-check-setup-b.png"

Write-Host ""
Write-Host "=== CAPTURE 2 : pytest cadrage (tp1-t2-cadrage.png) ===" -ForegroundColor Cyan
python -m pytest tests/test_cadrage.py -q
python -m pytest -q
Start-Sleep 1
Capture-Ecran "$proj\docs\captures\tp1-t2-cadrage.png"

Write-Host ""
Write-Host "Toutes les captures sont terminees !" -ForegroundColor Yellow
Write-Host "Verifiez docs\captures\" -ForegroundColor Yellow
