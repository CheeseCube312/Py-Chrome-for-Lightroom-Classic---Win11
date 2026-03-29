#!/bin/bash
# =============================================================================
# PyChrome - macOS Lightroom Integration Builder
# =============================================================================
# This script builds PyChrome.app for use with Adobe Lightroom Classic on macOS
#
# Usage: ./build_macos.sh
#
# Requirements: Python 3.7+ installed on macOS
# =============================================================================

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo ""
echo "========================================"
echo " Building PyChrome.app for Lightroom"
echo "========================================"
echo ""

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}ERROR: Python 3 is not installed${NC}"
    echo "Please install Python 3.7 or later from https://www.python.org/"
    exit 1
fi

PYTHON_VERSION=$(python3 --version)
echo -e "${CYAN}Found: $PYTHON_VERSION${NC}"

# Create virtual environment if it doesn't exist
if [ ! -d ".venv" ]; then
    echo -e "${CYAN}Creating virtual environment...${NC}"
    python3 -m venv .venv
    
    echo -e "${CYAN}Installing dependencies...${NC}"
    .venv/bin/pip install --upgrade pip
    .venv/bin/pip install numpy pillow dearpygui tifffile
else
    echo -e "${GREEN}Virtual environment already exists${NC}"
fi

# Install PyInstaller
echo ""
echo -e "${CYAN}Installing PyInstaller...${NC}"
.venv/bin/pip install pyinstaller

# Build the .app bundle
echo ""
echo -e "${CYAN}Building PyChrome.app...${NC}"
echo ""
.venv/bin/pyinstaller --onefile --windowed --name PyChrome lr_launcher.py

# Check if build was successful
if [ -d "dist/PyChrome.app" ]; then
    echo ""
    echo "========================================"
    echo -e " ${GREEN}SUCCESS! PyChrome.app ready${NC}"
    echo "========================================"
    echo ""
    echo "Location: dist/PyChrome.app"
    
    # Get size of the .app bundle
    APP_SIZE=$(du -sh dist/PyChrome.app | cut -f1)
    echo "Size: $APP_SIZE"
    
    echo ""
    echo "Next steps for Lightroom integration:"
    echo "1. Open Lightroom Classic"
    echo "2. Lightroom → Preferences → External Editing"
    echo "3. Choose: dist/PyChrome.app"
    echo "4. Format: TIFF, 16-bit, sRGB"
    echo ""
    echo "See LIGHTROOM_INTEGRATION.md for details."
    echo ""
else
    echo ""
    echo -e "${RED}ERROR: Build failed${NC}"
    echo "Check the output above for errors."
    exit 1
fi
