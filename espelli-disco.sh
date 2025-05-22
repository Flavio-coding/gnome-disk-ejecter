#!/bin/bash

clear

# Trova disco root
root_dev=$(findmnt -n -o SOURCE /)
root_disk=$(lsblk -no PKNAME "$root_dev")

# Prepara lista dischi validi
dischi=()
while read -r nome label modello tipo; do
    if [[ "$tipo" == "disk" && "$nome" != "$root_disk" && "$nome" != zram* ]]; then
        path="/dev/$nome"
        userlabel=$(lsblk -no LABEL "$path" | head -n 1)
        # Nome preferito: LABEL > MODEL > nome dispositivo
        if [[ -n "$userlabel" ]]; then
            friendly="$userlabel"
        elif [[ -n "$modello" ]]; then
            friendly="$modello"
        else
            friendly="$nome"
        fi
        dischi+=("$path::$friendly")
    fi
done < <(lsblk -dn -o NAME,LABEL,MODEL,TYPE -e 7,11)  # esclude loop/zram via codice

# Nessun disco esterno trovato
if [ ${#dischi[@]} -eq 0 ]; then
    zenity --warning --modal --text="Nessun disco esterno collegato da poter spegnere."
    exit 0
fi

# Elenco dischi con scelta
scelta=$(zenity --list --title="Dischi esterni collegati" --column="Dispositivo" --column="Descrizione" \
    --width=500 --height=300 --modal \
    $(printf "%s\n" "${dischi[@]}" | sed 's/::/\t/'))

if [ -z "$scelta" ]; then
    exit 0
fi

dispositivo="${scelta%%::*}"

# Conferma spegnimento
if ! zenity --question --title="Conferma spegnimento" --modal --text="Hai selezionato: $dispositivo\nConfermi lo spegnimento del disco?"; then
    zenity --info --modal --text="Operazione annullata."
    exit 0
fi

# Smontaggio partizioni montate
partizioni=$(lsblk -ln -o NAME,MOUNTPOINT | grep "^$(basename "$dispositivo")" | awk '$2!="" {print "/dev/"$1}')

if [ -z "$partizioni" ]; then
    zenity --info --modal --timeout=2 --no-markup --text="Nessuna partizione montata da smontare."
else
    for part in $partizioni; do
        zenity --info --modal --timeout=2 --no-markup --text="Smonto $part..."
        udisksctl unmount -b "$part" 2>/dev/null
    done
fi

sleep 1

# Spegnimento disco
zenity --info --modal --timeout=2 --no-markup --text="Spegnimento in corso di $dispositivo..."
output=$(udisksctl power-off -b "$dispositivo" 2>&1)
codice_uscita=$?

if [ $codice_uscita -eq 0 ]; then
    zenity --info --modal --text="Disco spento con successo."
else
    zenity --error --modal --text="Errore durante lo spegnimento:\n$output"
fi

exit 0
