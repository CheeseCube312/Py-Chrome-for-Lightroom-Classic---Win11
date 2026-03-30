Py-Chrome V9 for Lightroom
============

This "bridged" version connects matthewriondino's PyChrome into Adobe Lightroom Classic (LRc). It basicly works the same way "Edit in Photoshop" works: You choose an image in LRc and then you can hand it over to PyChrome. After you're done editing it over there you save it using "Save and Return" and it gets sent back to LRc.

Overview 
--------
"Py-Chrome V9 is a desktop tool for IR photo conversion and analysis made to emulate CIR, formally known as Aerochrome.
It provides a live preview pipeline, white-balance tools, scatter/histogram diagnostics,
preset management, and export options from a DearPyGui interface." - PyChrome ReadMe

For more information, check out the original PyChrome Page:
https://github.com/matthewriondino/Py-Chrome

Fast Installation (Windows)
--------------------------
1. Download [PyChrome-Lightroom-v9.zip ](https://github.com/CheeseCube312/Py-Chrome-for-Lightroom-Classic---Win11/releases/download/Py-Chrome/PyChrome-Lightroom-v9.zip) from the latest Release
2. Extract to desired folder
3. Add as external editing program in Lightroom*

*see below

Installation + Build (MacOS)
-------------------
Disclaimer: Untested, Experimental. Do not have a MacOS devcice to test with.
1. Install Python (https://www.python.org/downloads/)
2. Download [PyChrome.For.Lightroom.MacOS.zip](https://github.com/CheeseCube312/Py-Chrome-for-Lightroom-Classic---Win11/releases/download/Py-Chrome-LR-MacOSv0.1/PyChrome.for.Lightroom.MacOS.zip) and extract the zip into a folder.
3. Run build_macos.sh to create the .app file
4. Add as external editing program in Lightroom

Adding External Editing Programs in Lightroom:
--------
1. Open Lightroom Classic"
2. Lightroom → Preferences → External Editing"
3. Choose: dist/PyChrome.app"
4. Format: TIFF, 16-bit, sRGB"
5. (recommended) Save as Preset

Special thanks to matthewriondino for creating PyChrome.
https://github.com/matthewriondino
    
License / Use
-------------
MIT
