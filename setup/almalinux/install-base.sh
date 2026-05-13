#!/usr/bin/env bash
set -euo pipefail

echo "[1/4] Instalando pacotes base (dnf)..."
sudo dnf install -y epel-release
sudo dnf install -y git curl wget unzip wine

echo "[2/4] Garantindo Flatpak..."
if ! command -v flatpak >/dev/null 2>&1; then
  sudo dnf install -y flatpak
fi

echo "[3/4] Configurando Flathub..."
if ! flatpak remotes | grep -q '^flathub$'; then
  sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

echo "[4/4] Instalando apps desktop (Flatpak)..."
flatpak install -y flathub \
  io.dbeaver.DBeaverCommunity \
  com.bitwarden.desktop \
  org.remmina.Remmina \
  org.flameshot.Flameshot

echo "Concluido: instalacao base finalizada."