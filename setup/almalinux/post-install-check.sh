#!/usr/bin/env bash
set -euo pipefail

ok() {
  echo "[OK] $1"
}

warn() {
  echo "[WARN] $1"
}

check_cmd() {
  local cmd="$1"
  local label="$2"
  if command -v "$cmd" >/dev/null 2>&1; then
    ok "$label ($cmd) encontrado"
  else
    warn "$label ($cmd) nao encontrado"
  fi
}

check_flatpak_app() {
  local app_id="$1"
  local label="$2"
  if flatpak info "$app_id" >/dev/null 2>&1; then
    ok "$label instalado via Flatpak ($app_id)"
  else
    warn "$label nao encontrado no Flatpak ($app_id)"
  fi
}

echo "== Checagem pos-instalacao (AlmaLinux) =="

check_cmd git "Git"
check_cmd wine "Wine"
check_cmd flatpak "Flatpak"

check_flatpak_app io.dbeaver.DBeaverCommunity "DBeaver"
check_flatpak_app com.bitwarden.desktop "Bitwarden"
check_flatpak_app org.remmina.Remmina "Remmina"
check_flatpak_app org.flameshot.Flameshot "Flameshot"

echo
echo "Dicas de execucao:"
echo "- flatpak run io.dbeaver.DBeaverCommunity"
echo "- flatpak run com.bitwarden.desktop"
echo "- flatpak run org.remmina.Remmina"
echo "- flatpak run org.flameshot.Flameshot"
echo "- wine --version"