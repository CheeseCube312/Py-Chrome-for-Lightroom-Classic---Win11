@echo off
REM Build PyChrome.exe launcher for Lightroom integration
echo Building PyChrome launcher for Lightroom integration...
echo.

REM Check if virtual environment exists
if not exist ".venv\Scripts\python.exe" (
    echo ERROR: Virtual environment not found!
    echo Please run runPyChrome.bat first to create the venv.
    pause
    exit /b 1
)

REM Check if PyInstaller is installed
.venv\Scripts\python.exe -c "import PyInstaller" 2>nul
if errorlevel 1 (
    echo Installing PyInstaller...
    .venv\Scripts\pip.exe install pyinstaller
    echo.
)

REM Build the launcher
echo Building PyChrome.exe...
.venv\Scripts\pyinstaller.exe --onefile --noconsole --name PyChrome lr_launcher.py

if errorlevel 1 (
    echo.
    echo ERROR: Build failed!
    pause
    exit /b 1
)

REM Copy to root folder
echo.
echo Copying PyChrome.exe to root folder...
copy /Y dist\PyChrome.exe PyChrome.exe

if exist PyChrome.exe (
    echo.
    echo ========================================
    echo SUCCESS! PyChrome.exe ready.
    echo ========================================
    echo.
    echo Next steps:
    echo 1. Open Lightroom Classic
    echo 2. Edit -^> Preferences -^> External Editing
    echo 3. Choose: %CD%\PyChrome.exe
    echo 4. Format: TIFF, 16-bit, sRGB
    echo.
    echo See LIGHTROOM_INTEGRATION.md for details.
    echo.
) else (
    echo ERROR: Failed to copy PyChrome.exe
    pause
    exit /b 1
)

pause
