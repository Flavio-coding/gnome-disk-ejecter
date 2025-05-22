#!/bin/bash

# ----------- INTESTAZIONE GRAFICA -----------
echo -e "\033[1;34m"
echo "╔══════════════════════════════════════════════════════════════════════╗"
echo "║   INSTALLAZIONE DELLO SCRIPT DI ESPULSIONE SICURA DEI DISCHI         ║"
echo "╚══════════════════════════════════════════════════════════════════════╝"
echo -e "\033[0m"

REPO_URL="https://raw.githubusercontent.com/Flavio-coding/gnome-disk-ejecter/main"
SCRIPTS_DIR="$HOME/Scripts"
DESKTOP_FILE="$HOME/.local/share/applications/espelli-disco.desktop"
INSTALLER_PATH="$(realpath "$0")"

# ----------- CONTROLLO ZENITY -----------
if ! command -v zenity &> /dev/null; then
  echo "❌ Zenity non è installato o non funzionante."
  echo "Consulta la pagina ufficiale del progetto per istruzioni:"
  echo "https://github.com/Flavio-coding/gnome-disk-ejecter"
  exit 1
fi

# ----------- CREAZIONE CARTELLA Scripts -----------
echo "📁 Verifico cartella $SCRIPTS_DIR..."
mkdir -p "$SCRIPTS_DIR"
echo "✅ Cartella Scripts pronta."

# ----------- SCARICO SCRIPT DAL REPO -----------
SCRIPT_FILE="$SCRIPTS_DIR/espelli-disco.sh"
echo "⬇️  Scarico lo script espelli-disco.sh..."
curl -fsSL "$REPO_URL/espelli-disco.sh" -o "$SCRIPT_FILE" || {
  echo "❌ Errore nel download dello script."
  exit 1
}
chmod +x "$SCRIPT_FILE"
echo "✅ Script installato in $SCRIPT_FILE"

# ----------- SCARICO FILE .desktop -----------
echo "⬇️  Creo collegamento nella dash..."
mkdir -p "$(dirname "$DESKTOP_FILE")"
curl -fsSL "$REPO_URL/espelli-disco.desktop" -o "$DESKTOP_FILE" || {
  echo "❌ Errore nel download del file .desktop."
  exit 1
}
echo "✅ File .desktop creato."

# ----------- AGGIORNO DATABASE -----------
echo "🔄 Aggiorno database delle applicazioni..."
update-desktop-database ~/.local/share/applications/

# ----------- FINE INSTALLAZIONE -----------
echo "✅ Installazione completata con successo! Troverai 'Espelli Disco' nel menu delle applicazioni."

# ----------- AUTO DISTRUZIONE -----------
echo "💣 Auto-distruzione script installazione..."
rm -- "$INSTALLER_PATH"
