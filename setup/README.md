# Home Workspace Setup

Este diretorio guarda scripts para reconstruir seu ambiente em outro notebook.

## Fluxo rapido

1. Rodar instalacao base:

   bash setup/almalinux/install-base.sh

2. Rodar instalacao do Notepad++ via Wine:

   bash setup/almalinux/install-wine-notepadpp.sh

3. Validar instalacoes:

   bash setup/almalinux/post-install-check.sh

## Itens cobertos

- DBeaver (Flatpak)
- Bitwarden (Flatpak)
- Remmina (Flatpak)
- Flameshot (Flatpak)
- Wine (dnf)

## Itens com instalacao manual

- Navicat
- SQL Developer

Detalhes em setup/almalinux/manual-tools.md.