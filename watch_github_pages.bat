@echo off
title ORION GitHub Pages Monitor
color 0a
cls

echo ========================================
echo   ORION GITHUB PAGES MONITOR
echo ========================================
echo.
echo Verificando estado de GitHub Pages...
echo URL: https://agem2024.github.io/ORION-info-public/rosa/cv_pro.html
echo.

:CHECK
curl -s -o nul -w "%%{http_code}" https://agem2024.github.io/ORION-info-public/rosa/cv_pro.html > temp_status.txt
set /p STATUS=<temp_status.txt
del temp_status.txt

if "%STATUS%"=="200" (
    echo [%time%] EXITO - GitHub Pages esta ACTIVO
    echo.
    echo CV: https://agem2024.github.io/ORION-info-public/rosa/cv_pro.html
    echo Card: https://agem2024.github.io/ORION-info-public/rosa/card.html
    echo.
    start https://agem2024.github.io/ORION-info-public/rosa/cv_pro.html
    start https://agem2024.github.io/ORION-info-public/rosa/card.html
    pause
    exit
) else (
    echo [%time%] STATUS: %STATUS% - Esperando construccion de GitHub Pages...
    timeout /t 30 /nobreak >nul
    goto CHECK
)
