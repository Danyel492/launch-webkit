#!/usr/bin/env bash

# ==============================================================================
# Script: launch-webkit.sh
# Descrição: Verifica a instalação do WebKit no Playwright e inicia uma 
#            aba em branco (about:blank) para inspeção e testes no Ubuntu.
# ==============================================================================

set -e

# 1. Validação do ambiente Node/npx
if ! command -v npx &> /dev/null; then
    echo "[ERRO] 'npx' não foi encontrado. Certifique-se de que o Node.js e o npm estão instalados." >&2
    exit 1
fi

PLAYWRIGHT_CACHE="${HOME}/.cache/ms-playwright"
WEBKIT_INSTALLED=false

# 2. Verificação se o WebKit já existe no cache do sistema
if [ -d "$PLAYWRIGHT_CACHE" ]; then
    if ls -d "${PLAYWRIGHT_CACHE}"/webkit-* &> /dev/null; then
        WEBKIT_INSTALLED=true
    fi
fi

# 3. Instalação sob demanda (apenas se ausente)
if [ "$WEBKIT_INSTALLED" = true ]; then
    echo "[OK] Playwright WebKit já instalado em ${PLAYWRIGHT_CACHE}. Pulando download..."
else
    echo "[INFO] WebKit não encontrado. Baixando binários via Playwright..."
    npx -y playwright install webkit

    echo "[INFO] Verificando dependências de sistema operacional..."
    if ! npx -y playwright install-deps webkit 2>/dev/null; then
        echo "[AVISO] Não foi possível verificar dependências nativas automaticamente sem privilégios sudo."
        echo "        Se a janela não abrir, execute uma vez: sudo npx playwright install-deps webkit"
    fi
fi

# 4. Execução com aba em branco
echo "[INFO] Abrindo Playwright WebKit..."
npx -y playwright open --browser=webkit about:blank
