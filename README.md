# 🔌 Gnome Disk Ejecter

Un semplice script Bash con interfaccia **Zenity** che permette di **espellere in sicurezza dischi esterni** connessi al tuo PC Linux.


![Gnome Disk Ejecter - Screenshot](https://github.com/user-attachments/assets/906400eb-3f43-403f-838c-47f317f2daec)



## ❓ Perché usarlo?

Spesso, in alcuni ambienti desktop (come GNOME), i dischi esterni offrono solo l'opzione **"Smonta"** ma **non "Espelli"**. Questo è un problema, soprattutto per:

- **HDD meccanici**: continuano a girare anche dopo lo smontaggio.
- **Rimozione fisica**: senza espulsione sicura, il disco può subire danni.

Lo script **Gnome Disk Ejecter** risolve questo problema:

- 📂 Smonta in modo sicuro il filesystem del disco selezionato  
- ⚡ Disattiva l'alimentazione del dispositivo (espulsione sicura)  
- 🧠 Interfaccia grafica semplice grazie a **Zenity**

🖼️Ecco un esempio di sistema dove **l'opzione "Espelli" non è presente**:

![Solo smonta - Screenshot](https://github.com/user-attachments/assets/05ba6619-2902-4f21-b3a1-55526945b061)



## 🛠️ Installazione

Apri un terminale e incolla questo comando:

```bash
bash <(curl -fsSL -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/Flavio-coding/gnome-disk-ejecter/main/installer.sh)
```
Lo script verificherà innanzitutto la presenza di Zenity, il tool di GNOME che consente la creazione di semplici interfacce grafiche.
Se Zenity non è installato, verrà segnalato: potrai installarlo tramite il gestore pacchetti della tua distribuzione (es. su Arch Linux con yay -S zenity).

A seguire, lo script procederà a:
1. Scaricare lo script principale per l'espulsione dei dischi

2. Assegnargli i permessi di esecuzione (chmod +x)
    
3. Creareun collegamento grafico nella dash delle applicazioni di GNOME
    
⚠️ L'icona dell'app potrebbe impiegare qualche istante a comparire. Se non appare subito, prova a riavviare il PC.
    

---

Made by Flavio with ❤️.
Vuoi contruibuire al progetto? Migliora il codice, oppure contribuisci con le traduzioni!
