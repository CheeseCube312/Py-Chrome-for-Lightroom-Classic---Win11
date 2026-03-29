@echo off
echo Py-Chrome Launcher
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH!
    echo Please install Python from https://www.python.org/downloads/
    echo.
    pause
    exit /b 1
)

REM Check if .venv exists
if not exist ".venv\" (
    echo Creating virtual environment...
    python -m venv .venv
    echo Virtual environment created.
    echo.
)

REM Check if dependencies are installed by trying to import dearpygui
.venv\Scripts\python.exe -c "import dearpygui" 2>nul
if errorlevel 1 (
    echo Installing dependencies...
    .venv\Scripts\pip.exe install numpy pillow dearpygui tifffile
    echo Dependencies installed.
    echo.
)



REM Run the application
if not exist "app.py" (
    echo ERROR: Could not find app.py!
    pause
    exit /b 1
)
echo Starting Py-Chrome...
"%~dp0.venv\Scripts\python.exe" app.py %*
