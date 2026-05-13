#!/usr/bin/env bash
set -euo pipefail

TMP_DIR="${TMPDIR:-/tmp}"
NPP_EXE="$TMP_DIR/npp-installer.exe"
API_URL="https://api.github.com/repos/notepad-plus-plus/notepad-plus-plus/releases/latest"

echo "Descobrindo ultima versao do Notepad++..."
NPP_URL="$(curl -fsSL "$API_URL" | grep -Eo '"browser_download_url": "[^"]*Installer.x64.exe"' | head -n1 | cut -d'"' -f4)"

if [[ -z "${NPP_URL:-}" ]]; then
	echo "Falha ao localizar URL do instalador x64 no release mais recente." >&2
	exit 1
fi

echo "Baixando instalador: $NPP_URL"
curl -fL --retry 3 --retry-delay 2 "$NPP_URL" -o "$NPP_EXE"

# Evita tentar executar arquivo de erro/placeholder baixado incorretamente.
if [[ ! -s "$NPP_EXE" ]] || [[ "$(wc -c < "$NPP_EXE")" -lt 1000000 ]]; then
	echo "Download invalido do instalador (arquivo muito pequeno)." >&2
	exit 1
fi

echo "Instalando Notepad++ via Wine (modo silencioso)..."
if ! wine "$NPP_EXE" /S; then
	echo "Instalacao falhou no Wine. Verifique dependencias de Wine 32/64 bits." >&2
	exit 1
fi

echo "Instalacao concluida."
echo "Dica: atalho geralmente em ~/.wine/drive_c/Program Files/Notepad++/notepad++.exe"