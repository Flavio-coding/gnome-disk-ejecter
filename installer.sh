#!/bin/bash

# ----------- INTESTAZIONE GRAFICA -----------
echo -e "\033[1;34m"
echo "╔════════════════════════════════════════════════════════════════════════════╗"
echo "║         INSTALLAZIONE DELLO SCRIPT DI ESPULSIONE SICURA DEI DISCHI         ║"
echo "╚════════════════════════════════════════════════════════════════════════════╝"
echo -e "\033[0m"

REPO_URL="https://raw.githubusercontent.com/Flavio-coding/gnome-disk-ejecter/main"
SCRIPTS_DIR="$HOME/Scripts"
DESKTOP_FILE="$HOME/.local/share/applications/espelli-disco.desktop"
INSTALLER_PATH="$(realpath "$0")"

# ----------- CONFERMA UTENTE -----------
echo "Questo installer installerà lo script di espulsione sicura dei dischi, come descritto nella documentazione ufficiale."
echo
read -rp "Procedere con l'installazione? (S/n): " conferma

if [[ "$conferma" != "s" && "$conferma" != "S" ]]; then
  echo "❌ Installazione annullata."
  exit 1
fi


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

# ----------- SCARICO E ADATTO FILE .desktop -----------
echo "⬇️  Creo collegamento nella dash..."
mkdir -p "$(dirname "$DESKTOP_FILE")"
TEMP_FILE="$(mktemp)"

curl -fsSL "$REPO_URL/espelli-disco.desktop" -o "$TEMP_FILE" || {
  echo "❌ Errore nel download del file .desktop."
  rm -f "$TEMP_FILE"
  exit 1
}

# Espando $HOME all'interno del file .desktop
sed "s|\$HOME|$HOME|g" "$TEMP_FILE" > "$DESKTOP_FILE"
rm -f "$TEMP_FILE"
chmod +x "$DESKTOP_FILE"
echo "✅ File .desktop creato correttamente."

# ----------- AGGIORNO DATABASE -----------
echo "🔄 Aggiorno database delle applicazioni..."
update-desktop-database ~/.local/share/applications/

# ----------- FINE INSTALLAZIONE -----------
echo "✅ Installazione completata con successo! Troverai 'Espelli Disco' nel menu delle applicazioni"
