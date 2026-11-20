@echo off
title Destek Bilisim - Is Sagligi ve Guvenligi Egitimi Oturum Plani
chcp 65001 >nul
cd /d "%~dp0"
echo ====================================================================
echo   DESTEK BILISIM - IS SAGLIGI VE GUVENLIGI EGITIMI OTURUM PLANI
echo ====================================================================
echo.
if exist ".venv\Scripts\python.exe" (
    ".venv\Scripts\python.exe" run_seans.py --open-browser
) else (
    echo [BILGI] .venv sanal ortami bulunamadi, sistem Python'u deneniyor...
    python run_seans.py --open-browser
)
if errorlevel 1 (
    echo.
    echo ====================================================================
    echo Sunucu baslatilamadi!
    echo Eger ilk kez calistiriyorsaniz once KURULUM.bat dosyasina tiklayin.
    echo ====================================================================
)
pause
