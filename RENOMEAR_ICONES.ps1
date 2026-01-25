# Script para renomear ícones corretamente
# Remove a extensão dupla .png.png

Write-Host "Renomeando arquivos de ícone..." -ForegroundColor Cyan

$icon192 = "icon-192.png.png"
$icon512 = "icon-512.png.png"
$newIcon192 = "icon-192.png"
$newIcon512 = "icon-512.png"

if (Test-Path $icon192) {
    if (Test-Path $newIcon192) {
        Write-Host "Arquivo $newIcon192 já existe. Removendo..." -ForegroundColor Yellow
        Remove-Item $newIcon192 -Force
    }
    Rename-Item -Path $icon192 -NewName $newIcon192
    Write-Host "✓ $icon192 renomeado para $newIcon192" -ForegroundColor Green
} else {
    Write-Host "✗ Arquivo $icon192 não encontrado" -ForegroundColor Red
}

if (Test-Path $icon512) {
    if (Test-Path $newIcon512) {
        Write-Host "Arquivo $newIcon512 já existe. Removendo..." -ForegroundColor Yellow
        Remove-Item $newIcon512 -Force
    }
    Rename-Item -Path $icon512 -NewName $newIcon512
    Write-Host "✓ $icon512 renomeado para $newIcon512" -ForegroundColor Green
} else {
    Write-Host "✗ Arquivo $icon512 não encontrado" -ForegroundColor Red
}

Write-Host "`nRenomeação concluída!" -ForegroundColor Cyan
Write-Host "Agora você precisa atualizar as referências nos arquivos:" -ForegroundColor Yellow
Write-Host "  - index.html: alterar 'icon-192.png.png' para 'icon-192.png'" -ForegroundColor Yellow
Write-Host "  - manifest.json: alterar 'icon-192.png.png' para 'icon-192.png'" -ForegroundColor Yellow
Write-Host "  - sw.js: alterar 'icon-192.png.png' para 'icon-192.png'" -ForegroundColor Yellow
Write-Host "`nPressione qualquer tecla para continuar..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

