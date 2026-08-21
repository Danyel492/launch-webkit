#!/usr/bin/env bash

# ==============================================================================
# Script: launch-webkit.sh
# Description: Checks for WebKit installation via Playwright and opens a 
#              blank tab (about:blank) for inspection and testing on Ubuntu.
# ==============================================================================

set -e

# 1. Node/npx environment validation
if ! command -v npx &> /dev/null; then
    echo "[ERROR] 'npx' was not found. Please ensure Node.js and npm are installed." >&2
    exit 1
fi

PLAYWRIGHT_CACHE="${HOME}/.cache/ms-playwright"
WEBKIT_INSTALLED=false

# 2. Check if WebKit already exists in the system cache
if [ -d "$PLAYWRIGHT_CACHE" ]; then
    if ls -d "${PLAYWRIGHT_CACHE}"/webkit-* &> /dev/null; then
        WEBKIT_INSTALLED=true
    fi
fi

# 3. On-demand installation (only if missing)
if [ "$WEBKIT_INSTALLED" = true ]; then
    echo "[OK] Playwright WebKit is already installed at ${PLAYWRIGHT_CACHE}. Skipping download..."
else
    echo "[INFO] WebKit not found. Downloading binaries via Playwright..."
    npx -y playwright install webkit

    echo "[INFO] Checking OS dependencies..."
    if ! npx -y playwright install-deps webkit 2>/dev/null; then
        echo "[WARNING] Could not automatically verify native dependencies without sudo privileges."
        echo "          If the window fails to open, run this once: sudo npx playwright install-deps webkit"
    fi
fi

# 4. Execute with a blank tab
echo "[INFO] Opening Playwright WebKit..."
npx -y playwright open --browser=webkit about:blank