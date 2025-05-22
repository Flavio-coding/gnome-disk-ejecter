#!/bin/bash

# ----------- INTESTAZIONE GRAFICA -----------
echo -e "\033[1;31m"
echo "╔═══════════════════════════════════════════════════════════════════════════════╗"
echo "║         DISINSTALLAZIONE DELLO SCRIPT DI ESPULSIONE SICURA DEI DISCHI         ║"
echo "╚═══════════════════════════════════════════════════════════════════════════════╝"
echo -e "\033[0m"

SCRIPT_PATH="$HOME/Scripts/espelli-disco.sh"
DESKTOP_PATH="$HOME/.local/share/applications/espelli-disco.desktop"

# ----------- CONFERMA UTENTE -----------
echo "⚠️  Questo rimuoverà il file script e il collegamento dalla dash, come descritto nella documentazione ufficiale:"
echo " - $SCRIPT_PATH"
echo " - $DESKTOP_PATH"
echo
read -rp "Sei sicuro di voler procedere? (s/N): " conferma

if [[ "$conferma" != "s" && "$conferma" != "S" ]]; then
  echo "❌ Disinstallazione annullata."
  exit 1
fi

# ----------- RIMOZIONE FILE -----------
echo "🗑️  Rimozione dello script..."
if [[ -f "$SCRIPT_PATH" ]]; then
  rm "$SCRIPT_PATH" && echo "✅ Script rimosso: $SCRIPT_PATH" || echo "❌ Errore rimozione script."
else
  echo "ℹ️  Script non trovato: $SCRIPT_PATH"
fi

echo "🗑️  Rimozione del collegamento nella dash..."
if [[ -f "$DESKTOP_PATH" ]]; then
  rm "$DESKTOP_PATH" && echo "✅ Collegamento rimosso: $DESKTOP_PATH" || echo "❌ Errore rimozione collegamento."
else
  echo "ℹ️  Collegamento non trovato: $DESKTOP_PATH"
fi

# ----------- AGGIORNAMENTO DATABASE -----------
echo "🔄 Aggiorno database delle applicazioni..."
update-desktop-database ~/.local/share/applications/

echo
echo "✅ Disinstallazione completata."
