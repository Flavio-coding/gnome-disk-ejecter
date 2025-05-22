# Gnome disk ejecter
Un semplice script bash in zenity che smonta e spegne qualsiasi disco connesso al tuo PC linux, utile se di default hai solo l'opzione smonta e non espelli.


![immagine](https://github.com/user-attachments/assets/906400eb-3f43-403f-838c-47f317f2daec)

Quando premiamo "espelli", il sistema operativo smonta il filesystem del disco esterno, dunque non possiamo più comunicare con esso, e ne toglie alimentazione. In alcuni casi, compare solo il tasto smonta, dunque l'unico modo per fermare il disco e toglierlo fisicamente dalla porta USB. Quando è connesso un HHD meccanico, un espulsione sicura è consigliata.
Questo script permette di scegliere il disco da espellere, ne smonta il filesystem e ne toglie l'alimentazione.

  
  ![immagine](https://github.com/user-attachments/assets/05ba6619-2902-4f21-b3a1-55526945b061)



Per installare lo script, esegui in un terminale:
`bash <(curl -fsSL -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/Flavio-coding/gnome-disk-ejecter/main/installer.sh)`

Lo script procederà a controllare il corretto funzionamento di zenity, software Gnome che permette la realizzazione di semplici interfacce grafiche. In caso lo script ne segnali la mancanza, questo può essere installato con il package manager della tua distribuzione (per esempio, su arch linux si può installare con `yay -S zenity`).
Successivamente, scaricherà lo script vero e proprio di espulsione, gli da i permessi necessari (con chmod +x) e infine crea il collegamento dell'app della dash delle applicazioni di Gnome. 
⚠️ Prima che l'icona compaia nella dash potrebbe volerci qualche istante. In caso richieda troppo tempo, riavvia il PC



Made by Flavio with ❤️.

Vuoi contruibuire al progetto? Migliora il codice, oppure contribuisci con le traduzioni!
