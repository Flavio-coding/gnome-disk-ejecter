# Gnome disk ejecter
Un semplice script bash in zenity che smonta e spegne qualsiasi disco connesso al tuo PC linux, utile se di default hai solo l'opzione smonta e non espelli.
![immagine](https://github.com/user-attachments/assets/906400eb-3f43-403f-838c-47f317f2daec)

Per installare lo script, esegui in un terminale:
`bash <(curl -fsSL -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/Flavio-coding/gnome-disk-ejecter/main/installer.sh)`

Lo script procederà a controllare il corretto funzionamento di zenity, software Gnome che permette la realizzazione di semplici interfacce grafiche. In caso lo script ne segnali la mancanza, questo può essere installato con il package manager della tua distribuzione (per esempio, su arch linux si può installare con `yay -S zenity`).
Successivamente, scaricherà lo script vero e proprio di espulsione, gli da i permessi necessari (con chmod +x) e infine crea il collegamento dell'app della dash delle applicazioni di Gnome. 
⚠️ Prima che l'icona compaia nella dash potrebbe volerci qualche istante. In caso richieda troppo tempo, riavvia il PC



Made by Flavio with ❤️.

Vuoi contruibuire al progetto? Migliora il codice, oppure contribuisci con le traduzioni!
