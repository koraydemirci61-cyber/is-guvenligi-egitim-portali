@echo off
title Is Sagligi ve Guvenligi Portali - Otomatik Kurulum
chcp 65001 >nul
cd /d "%~dp0"
echo ====================================================================
echo   IS SAGLIGI VE GUVENLIGI EGITIMI PORTALI - OTOMATIK KURULUM
echo ====================================================================
echo.
echo 1) Python sanal ortami (.venv) hazirlaniyor...
python -m venv .venv
if errorlevel 1 (
    echo [HATA] Python bulunamadi veya venv olusturulamadi!
    echo Lutfen bilgisayarinizda Python 3.10+ kurulu oldugundan ve
    echo "Add Python to PATH" seceneginin secili oldugundan emin olun.
    pause
    exit /b 1
)

echo 2) Gerekli paketler yukleniyor (FastAPI, Uvicorn, Jinja2, OpenPyXL)...
call .venv\Scripts\activate.bat
python -m pip install --upgrade pip
pip install -r requirements.txt
if errorlevel 1 (
    echo [HATA] Paketler yuklenirken bir sorun olustu.
    pause
    exit /b 1
)

echo.
echo ====================================================================
echo   KURULUM BASARIYLA TAMAMLANDI!
echo   Portali baslatmak icin "BASLAT.bat" dosyasina tiklayabilirsiniz.
echo ====================================================================
pause
