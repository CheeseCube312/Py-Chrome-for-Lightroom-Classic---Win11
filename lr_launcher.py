"""
Tiny launcher for Lightroom's "Additional External Editor" integration.

Lightroom expects an .exe on Windows. This script locates the venv and app.py
relative to itself and forwards all arguments (the TIFF path from LR).

Build once with:
    .venv\Scripts\pyinstaller.exe --onefile --noconsole --name PyChrome lr_launcher.py
Then point LR's External Editor to the resulting PyChrome.exe.
"""

import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(sys.argv[0]))
VENV_PYTHON = os.path.join(HERE, ".venv", "Scripts", "python.exe")
APP_PY = os.path.join(HERE, "app.py")

if not os.path.isfile(APP_PY):
    print(f"ERROR: Cannot find {APP_PY}")
    sys.exit(1)

python = VENV_PYTHON if os.path.isfile(VENV_PYTHON) else "python"
sys.exit(subprocess.call([python, APP_PY] + sys.argv[1:]))
