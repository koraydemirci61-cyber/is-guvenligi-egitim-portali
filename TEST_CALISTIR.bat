@echo off
title Is Sagligi ve Guvenligi Portali - Otomatik Testler
chcp 65001 >nul
cd /d "%~dp0"
echo ====================================================================
echo   IS SAGLIGI VE GUVENLIGI EGITIMI PORTALI - TESTLER
echo ====================================================================
echo.
if exist ".venv\Scripts\python.exe" (
    ".venv\Scripts\python.exe" -m unittest test_seans_portal.py -v
) else (
    python -m unittest test_seans_portal.py -v
)
echo.
pause
