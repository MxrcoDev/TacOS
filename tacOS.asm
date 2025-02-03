; multi-segment executable file template.
data segment
    ; add your data here!
    pkey db " ", 13, 10
         db "Premi qualsiasi tasto per continuare...$"
    
    ; Messaggi LUMA OS
    logo db "    +---------------------------------+", 13, 10
         db "    |   _____                     _   |", 13, 10
         db "    |  |_   _|_ _  ___ ___  ___  | |  |", 13, 10
         db "    |    | |/ _` |/ __/ _ \/ __| | |  |", 13, 10
         db "    |    | | (_| | (_| (_) \__ \ |_|  |", 13, 10
         db "    |    |_|\__,_|\___\___/|___/ (_)  |", 13, 10
         db "    |                                 |", 13, 10
         db "    +---------------------------------+", 13, 10
         db "", 13, 10, "$"
    
    welcome db "", 13, 10
            db "         Benvenuto su tacOS v3.1       ", 13, 10
            db "      Sviluppato da Marco Gavioli, 3D    ", 13, 10
            db "  Digita 'help' per maggiori informazioni  ", 13, 10  
            db "", 13, 10
            db "", 13, 10, "$"
    newline db " ", 13, 10, "$"
            
    ; Messaggi di sistema
    login db 13, 10, "> Per utilizzare tacOS, effettua il login.", 13, 10, "$"
    usermsg db 13, 10, "NOME UTENTE: $"
    pwdmsg db 13, 10, "PASSWORD: $"
    notlogin db 13, 10, "> Password o nome utente errati!", 13, 10, "$"
    
    old_pwd_msg      db 13, 10 
                     db 13, 10, "Inserisci la vecchia password: $"
    new_pwd_msg      db 13, 10 
                     db 13, 10, "Inserisci la nuova password: $"
    confirm_pwd_msg  db 13, 10 
                     db 13, 10, "Conferma la nuova password: $"
    pwd_error_msg    db 13, 10
                     db 13, 10, "La vecchia password non e' corretta!", 13, 10, "$"
    pwd_mismatch_msg db 13, 10
                     db 13, 10, "Le password non coincidono!", 13, 10, "$"
    pwd_success_msg  db 13, 10 
                     db 13, 10, "Password cambiata con successo!", 13, 10, "$"
    
    prompt db " > admin@tacos > $"
    
    sconosciuto db " ", 13, 10
                db 13, 10, "Comando non riconosciuto. Digita 'help' per maggiori informazioni!", 13, 10
                db " ", 13, 10, "$"
    help_msg    db " ", 13, 10
                db 13, 10, "Lista dei comandi:", 13, 10
                db 13, 10, "help  --> Mostra la lista dei comandi", 13, 10
                db "exit  --> Torna alla schermata di login", 13, 10
                db "pwd   --> Cambia password", 13, 10
                db "cls   --> Pulisci lo schermo", 13, 10
                db "calc  --> Apri la calcolatrice", 13, 10
                db " ", 13, 10, "$"
    
    calc_msg    db "", 13, 10
                db "  _______                          _      ", 13, 10
                db " |__   __|                        | |     ", 13, 10
                db "    | | __ _  ___ ___     ___ __ _| | ___ ", 13, 10
                db "    | |/ _` |/ __/ _ \   / __/ _` | |/ __|", 13, 10
                db "    | | (_| | (_| (_) | | (_| (_| | | (__ ", 13, 10
                db "    |_|\__,_|\___\___/   \___\__,_|_|\___|", 13, 10
                db "                                          ", 13, 10 
                db "Benvenuto nella calcolatrice!", 13, 10
                db "Premi CTRL+C per uscire.", 13, 10
                db "", 13, 10
                db "1. Somma", 13, 10
                db "2. Sottrazione", 13, 10
                db "3. Moltiplicazione", 13, 10
                db "4. Divisione", 13, 10
                db "5. Potenza", 13, 10
                db "6. Radice quadrata", 13, 10
                db "7. Logaritmo naturale in base 2", 13, 10
                db " ", 13, 10,
                db "Quale operazione vuoi eseguire? (Digita il numero)$" 
    
    num1_msg db 13, 10                
             db 13, 10                
             db "    > Inserisci primo numero: $"  
            
    num2_msg db 13, 10                
             db 13, 10               
             db "    > Inserisci secondo numero: $" 
            
    result_msg db 13, 10              
               db 13, 10
               db 13, 10                
               db "    Risultato: $"   
             
    error_msg db 13, 10              
              db 13, 10
              db 13, 10                
              db "    Errore! Divisione per zero.$" 
            
    
    ; Memoria
    username db 20 dup(0)    ; Buffer per username
    password db 20 dup(0)    ; Buffer per password
    new_password db 20 dup(0)    ; Buffer per nuova password
    confirm_password db 20 dup(0) ; Buffer per conferma password
    cmd_buffer   db 50 dup(0)
    cmd_size     db 0
    
    num1 dw 0
    num2 dw 0
    result dw 0
    decimal_part dw 0
    
    
    ; Stringhe comandi
    help_cmd     db "help", 0
    exit_cmd     db "exit", 0
    pwd_cmd      db "pwd", 0
    cls_cmd      db "cls", 0
    calc_cmd     db "calc", 0
    mines_cmd    db "mines", 0
    
    ; Stringhe di supporto
    asterisco db "*$"
    backspace db 8, ' ', 8, "$"   ; Sequenza per cancellare un carattere: indietro, spazio, indietro
    
    ; Credenziali valide
    valid_user db "admin$"
    valid_pwd  db "admin$"
    
    ; Messaggi snake
    mines_logo db "", 13, 10
               db "  _______ _________ _        _______  _______ ", 13, 10
               db " (       )\__   __/( (    /|(  ____ \(  ____ \", 13, 10
               db " | () () |   ) (   |  \  ( || (    \/| (    \/", 13, 10
               db " | || || |   | |   |   \ | || (__    | (_____ ", 13, 10
               db " | |(_)| |   | |   | (\ \) ||  __)   (_____  )", 13, 10
               db " | |   | |   | |   | | \   || (            ) |", 13, 10
               db " | )   ( |___) (___| )  \  || (____/\/\____) |", 13, 10
               db " |/     \|\_______/|/    )_)(_______/\_______)", 13, 10
               db "", 13, 10 
               db "", 13, 10 
               db "", 13, 10, "$"
    
    mines_instructions db 13, 10
                       db " Istruzioni", 13, 10
                       db "", 13, 10
                       db " Benvenuto in 'Mines', un gioco dove ", 13, 10
                       db " ogni clic e' una sfida alla fortuna!", 13, 10
                       db "", 13, 10
                       db " Il tuo obbiettivo e' semplice:", 13, 10
                       db " raccogli quante piu' vincite possibili", 13, 10 
                       db " evitando le mine nascoste.", 13, 10
                       db "", 13, 10
                       db " Ogni casella scoperta senza una mina aumenta", 13, 10
                       db " il moltiplicatore di vincita.", 13, 10
                       db " A Ogni clic ti avvicini al jackpot,", 13, 10
                       db " ma basta una mina per perdere tutto!", 13, 10
                       db "", 13, 10
                       db " COMANDI:", 13, 10
                       db "", 13, 10
                       db "    WASD   - Spostati nel campo minato.", 13, 10
                       db "    SPAZIO - Scopri la casella.", 13, 10 
                       db "    INVIO  - Esegui il cashout.", 13, 10 
                       db "", 13, 10
                       db "", 13, 10
                       db " Premi qualsiasi tasto per continuare...", 13, 10
                       db "", 13, 10, "$"
                       
    
    mines_campo db "",13,10
                db "     +-----+", 13, 10
                db "     |     |", 13, 10
                db "     |     |", 13, 10
                db "     |     |", 13, 10
                db "     |     |", 13, 10
                db "     |     |", 13, 10
                db "     +-----+", 13, 10
                db "",13,10
                db "",13,10,"$"
    
    mines_premitasto db 13,10," Premi qualsiasi tasto per iniziare$"
    mines_exit       db 13,10," Premi CTRL+C per uscire$"
    mines_puntata    db 13,10,"     > Quanto vuoi puntare? $"
    mines_saldo      db 13,10,"     > Saldo attuale: $"
    mines_vincita    db 13,10,"     > Vincita: $"
    mines_gameover   db "",13,10
                     db "     ____  ____  ____  __  _____",13,10
                     db "    / __ )/ __ \/ __ \/  |/  / /",13,10
                     db "   / __  / / / / / / / /|_/ / / ",13,10
                     db "  / /_/ / /_/ / /_/ / /  / /_/  ",13,10
                     db " /_____/\____/\____/_/  /_(_)   ",13,10
                     db "",13,10
                     db "",13,10
                     db " Hai perso!",13,10
                     db "",13,10
                     db " Il tuo saldo:$"
    mines_cashout    db "",13,10
                     db "              (       )    )               ____ ",13,10
                     db "    (    (     )\ ) ( /( ( /(         *   )|   / ",13,10
                     db "    )\   )\   (()/( )\()))\())    ( ` )  /(|  /  ",13,10
                     db "  (((_|(((_)(  /(_)|(_)\((_)\     )\ ( )(_)) /   ",13,10
                     db "  )\___)\ _ )\(_))  _((_) ((_) _ ((_|_(_())|/    ",13,10
                     db " ((/ __(_)_\(_) __|| || |/ _ \| | | |_   _(      ",13,10
                     db "  | (__ / _ \ \__ \| __ | (_) | |_| | | | )\     ",13,10
                     db "   \___/_/ \_\|___/|_||_|\___/ \___/  |_|((_)    ",13,10
                     db "",13,10
                     db "",13,10
                     db " Vincita: $"
    
    saldo dw 10
    pos_x db 1
    pos_y db 1
    puntata dw 0
    vincita dw 0
    contatore_caselle db 0
    caselle_aperte db 25 dup(0)  ; Mappa caselle aperte
    mine db 25 dup(0)
    
    
    
    
    
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    ; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    ; Mostra il logo
    lea dx, logo
    mov ah, 9
    int 21h
    
    ; Mostra il messaggio di login
    lea dx, login
    mov ah, 9
    int 21h
    
    ; Mostra il prompt username
    lea dx, usermsg
    mov ah, 9
    int 21h
    
    xor si, si      ; Azzera SI per l'indice del buffer
    
utente:
    mov ah, 8       ; Lettura carattere senza echo
    int 21h
    
    ; Se il tasto premuto e' invio
    cmp al, 13
    je ottieni_utente
    
    ; Se il tasto premuto e' backspace
    cmp al, 8
    je handler_utente
    
    ; Controlla se abbiamo raggiunto il limite del buffer
    cmp si, 19      
    jae utente    ; Se si, ignora l'input
    
    ; Altrimenti, memorizza e mostra il carattere
    mov username[si], al
    inc si
    
    mov dl, al      ; Mostra il carattere
    mov ah, 2
    int 21h
    
    jmp utente

handler_utente:
    ; Controlla se siamo all'inizio del buffer
    cmp si, 0
    je utente    ; Se si, ignora il backspace
    
    ; Altrimenti, cancella l'ultimo carattere
    lea dx, backspace
    mov ah, 9
    int 21h
    
    dec si          ; Decrementa l'indice del buffer
    mov username[si], 0   ; Cancella il carattere dal buffer
    
    jmp utente
    
ottieni_utente:
    mov username[si], '$'
    
    ; Mostra il prompt password
    lea dx, pwdmsg
    mov ah, 9
    int 21h
    
    xor si, si      ; Azzera SI per il nuovo input
    
pwd:
    mov ah, 8   ; Input nascosto
    int 21h
    
    ; Se il tasto premuto e' invio
    cmp al, 13
    je ottieni_pwd
    
    ; Se il tasto premuto e' backspace
    cmp al, 8
    je handler_pwd
    
    ; Controlla il limite del buffer
    cmp si, 19
    jae pwd
    
    mov password[si], al
    inc si
    
    lea dx, asterisco
    mov ah, 9
    int 21h
    jmp pwd
    
handler_pwd:
    ; Controlla se siamo all'inizio del buffer
    cmp si, 0
    je pwd
    
    ; Altrimenti, cancella l'ultimo carattere
    lea dx, backspace
    mov ah, 9
    int 21h
    
    dec si
    mov password[si], 0
    
    jmp pwd

ottieni_pwd:
    mov password[si], '$'
    
    call controlla_credenziali
    cmp al, 1
    je main
    
    call cls
     
    ; Mostra il logo
    lea dx, logo
    mov ah, 9
    int 21h
    
    ; Mostra il messaggio di login
    lea dx, notlogin
    mov ah, 9
    int 21h
    
    ; Mostra il prompt username
    lea dx, usermsg
    mov ah, 9
    int 21h
    
    xor si, si      ; Azzera SI per l'indice del buffer
    
    jmp utente ; Ritorna all'inserimento del nome utente

main:
    call cls
    
    ; Stampa il logo
    lea dx, logo
    mov ah, 9
    int 21h
    
    ; Stampa il messaggio di benvenuto
    lea dx, welcome
    mov ah, 9
    int 21h

scrivi_prompt:
    
    lea dx, newline
    mov ah, 9
    int 21h
        
    ; Stampa il prompt
    lea dx, prompt
    mov ah, 9
    int 21h
    
    xor si, si
prompt_cmd:
    mov ah, 8       ; Lettura carattere senza echo
    int 21h
    
    ; Se il tasto premuto e' invio
    cmp al, 13
    je ottieni_cmd
    
    ; Se il tasto premuto e' backspace
    cmp al, 8
    je handler_cmd
    
    ; Controlla se abbiamo raggiunto il limite del buffer
    cmp si, 49      
    jae prompt_cmd    ; Se si, ignora l'input
    
    ; Altrimenti, memorizza e mostra il carattere
    mov cmd_buffer[si], al
    inc si
    
    mov dl, al      ; Mostra il carattere
    mov ah, 2
    int 21h
    
    jmp prompt_cmd
    
handler_cmd:
    ; Controlla se siamo all'inizio del buffer
    cmp si, 0
    je prompt_cmd    ; Se si, ignora il backspace
    
    ; Altrimenti, cancella l'ultimo carattere
    lea dx, backspace
    mov ah, 9
    int 21h
    
    dec si          ; Decrementa l'indice del buffer
    mov cmd_buffer[si], 0   ; Cancella il carattere dal buffer
    
    jmp prompt_cmd

ottieni_cmd:
    mov cmd_buffer[si], 0
    
    ; Verifica comando help
    lea si, cmd_buffer
    lea di, help_cmd
    call compare_strings
    cmp ax, 1
    je comando_help
    
    ; Verifica comando exit
    lea si, cmd_buffer
    lea di, exit_cmd
    call compare_strings
    cmp ax, 1
    je comando_exit
    
    ; Verifica comando pwd
    lea si, cmd_buffer
    lea di, pwd_cmd
    call compare_strings
    cmp ax, 1
    je comando_pwd 
    
    ; Verifica comando pwd
    lea si, cmd_buffer
    lea di, cls_cmd
    call compare_strings
    cmp ax, 1
    je comando_cls
    
    ; Verifica comando calc
    lea si, cmd_buffer
    lea di, calc_cmd
    call compare_strings
    cmp ax, 1
    je comando_calc
    
    ; Verifica comando mines
    lea si, cmd_buffer
    lea di, mines_cmd
    call compare_strings
    cmp ax, 1
    je comando_mines
    
    ; Verifica comando mkdir
    ;lea si, cmd_buffer
    ;lea di, mkdir_cmd
    ;call compare_strings
    ;cmp ax, 1
    ;je comando_mkdir
    
    ; Verifica comando cd
    ;lea si, cmd_buffer
    ;lea di, cd_cmd
    ;call compare_strings
    ;cmp ax, 1
    ;je comando_cd
    
    ; Verifica comando dir
    ;lea si, cmd_buffer
    ;lea di, dir_cmd
    ;call compare_strings
    ;cmp ax, 1
    ;je comando_dir
    
    ; Comando non riconosciuto
    lea dx, sconosciuto
    mov ah, 9
    int 21h
    jmp scrivi_prompt

comando_help:
    
    ; Mostra il messaggio di help e riscrivi il prompt
    
    lea dx, help_msg
    mov ah, 9
    int 21h 
    jmp scrivi_prompt

comando_exit:
    ; Pulisci lo schermo e ritorna al'inizio
    call cls
    jmp start

comando_cls:
    ; Ritorna alla schermata del terminale
    jmp main


; --- GESTIONE SNAKE ---
comando_mines:
        ; Pulisci lo schermo
        call cls
        
        ; Mostra il logo
        lea dx, mines_logo
        mov ah, 9
        int 21h
        
        lea dx, mines_premitasto
        mov ah, 9
        int 21h
        
        ; Attendi input iniziale
        mov ah, 8
        int 21h
        
        ; Se CTRL+C, torna al main
        cmp al, 3
        je main 
        
        call cls
        lea dx, mines_instructions
        mov ah, 9
        int 21h
        
        mov ah, 8
        int 21h
        
        call reset_game
        
    mines_start:
        ; Pulisci schermo
        call cls
        
        ; Mostra i controlli
        lea dx, mines_logo
        mov ah, 9
        int 21h
        
        ; Mostra saldo attuale
        lea dx, mines_saldo
        mov ah, 9
        int 21h
        
        ; Mostra il saldo come numero
        xor ah, ah
        mov ax, saldo
        call mostra_numero
        
        ; Chiedi puntata
        lea dx, mines_puntata
        mov ah, 9
        int 21h
        
        ; Leggi puntata
    get_bet:
        ; Leggi la puntata
        call leggi_puntata
        
        ; Verifica che la puntata non sia zero
        cmp ax, 0
        je get_bet
        
        ; Salva puntata
        mov puntata, ax
        
        ; Sottrai puntata dal saldo
        mov bx, word ptr [saldo]
        sub bx, ax
        mov saldo, bx
        
        jmp game_loop
        
    game_loop:
        call aggiorna_schermo
        
        mov ah, 8
        int 21h
        
        cmp al, 13          ; Enter (cashout)
        je cashout
        cmp al, 32          ; Spazio (rivela casella)
        je controlla_casella
        cmp al, 3           ; CTRL+C (esci)
        je main
        
        cmp al, 119         ; W
        je move_up
        cmp al, 115         ; S
        je move_down
        cmp al, 97          ; A
        je move_left
        cmp al, 100         ; D
        je move_right
        
        jmp game_loop        
        
   move_up:
        cmp pos_y, 1
        jle game_loop
        dec pos_y
        jmp game_loop
    
   move_down:
        cmp pos_y, 5
        jge game_loop
        inc pos_y
        jmp game_loop
        
   move_left:
        cmp pos_x, 1
        jle game_loop
        dec pos_x
        jmp game_loop
        
   move_right:
        cmp pos_x, 5
        jge game_loop
        inc pos_x
        jmp game_loop 
        
   controlla_casella:
        ; Calcola indice
        mov al, pos_y
        dec al
        mov bl, 5
        mul bl
        add al, pos_x
        dec al
        mov bl, al
        
        ; Verifica casella gia' aperta
        cmp caselle_aperte[bx], 1
        je game_loop
        
        ; Segna casella come aperta
        mov caselle_aperte[bx], 1
        inc contatore_caselle
        
        ; Verifica presenza mina
        cmp mine[bx], 1
        je boom
        
        ; Verifica vittoria (ogni 2 caselle)
        mov al, contatore_caselle
        mov bl, 2
        div bl
        cmp ah, 0
        je win
        
        ; Mostra messaggio vittoria
        jmp game_loop 
    
        win:
        ; Calcola la nuova vincita (puntata + vincita precedente)
        mov ax, puntata
        add ax, vincita
        mov vincita, ax
        jmp game_loop
            
    cashout:
        ; Aggiungi la vincita al saldo
        mov ax, vincita
        add ax, saldo
        mov saldo, ax
            
        call cls
            
        lea dx, mines_cashout
        mov ah, 9
        int 21h
            
        mov ax, vincita
        call mostra_numero
            
        lea dx, mines_premitasto
        mov ah, 9
        int 21h
            
        lea dx, mines_exit
        mov ah, 9
        int 21h
            
        mov ah, 8
        int 21h
            
        cmp al, 3
        je main
            
        call reset_game
        jmp mines_start    ; Torna all'inizio del gioco
        
    boom:
        ; In caso di perdita, non viene aggiunta nessuna vincita
        call cls
        lea dx, mines_gameover
        mov ah, 9
        int 21h
            
        mov ax, saldo
        call mostra_numero
            
        lea dx, mines_premitasto
        mov ah, 9
        int 21h
            
        lea dx, mines_exit
        mov ah, 9
        int 21h
            
        mov ah, 8
        int 21h
             
        cmp al, 3
        je main
            
        call reset_game
        jmp mines_start 
        
; PROCEDURE MINES
leggi_puntata proc
    push bx
    push cx
    push dx
    
    xor bx, bx      ; Azzera puntata accumulata
    
input_loop:
    mov ah, 8       ; Leggi carattere senza echo
    int 21h
    
    cmp al, 13      ; Se INVIO, termina input
    je fine_input
    
    cmp al, 8       ; Se BACKSPACE
    je gestisci_backspace
    
    cmp al, '0'     ; Verifica se è un numero
    jb input_loop
    cmp al, '9'
    ja input_loop
    
    ; Converti e accumula il numero
    sub al, '0'     ; Converti ASCII in numero
    xor ah, ah      ; Pulisci AH
    
    ; Salva il carattere originale
    push ax         ; Salva il valore numerico
    
    ; Moltiplica la puntata accumulata per 10
    mov ax, bx
    mov cx, 10
    mul cx
    
    ; Recupera il valore numerico
    pop dx          
    add ax, dx      ; Aggiungi la nuova cifra
    
    cmp ax, 65535   ; Verifica overflow
    ja input_loop
    
    ; Verifica se supera il saldo
    cmp ax, word ptr [saldo]
    ja input_loop
    
    ; Se arriviamo qui, il numero è valido
    mov bx, ax      ; Aggiorna la puntata accumulata
    
    ; Mostra il carattere originale
    add dl, '0'     ; Converti in ASCII
    mov ah, 2       ; Stampa carattere
    int 21h
    
    jmp input_loop
    
gestisci_backspace:
    ; Se non ci sono numeri da cancellare
    cmp bx, 0
    je input_loop
    
    ; Cancella carattere dallo schermo
    mov dl, 8       ; Backspace
    mov ah, 2
    int 21h
    mov dl, ' '     ; Spazio
    mov ah, 2
    int 21h
    mov dl, 8       ; Backspace di nuovo
    mov ah, 2
    int 21h
    
    ; Rimuovi l'ultima cifra dal numero
    mov ax, bx
    mov cx, 10
    xor dx, dx
    div cx          ; Divide per 10
    mov bx, ax      ; Salva il risultato
    
    jmp input_loop
    
fine_input:
    mov ax, bx      ; Metti il risultato in AX
    
    pop dx
    pop cx
    pop bx
    ret
leggi_puntata endp

reset_game proc
    push ax
    push cx
    push di
    
    mov contatore_caselle, 0
    mov vincita, 0
    
    ; Reset arrays
    mov cx, 25
    mov di, 0
clear_arrays:
    mov caselle_aperte[di], 0
    mov mine[di], 0
    inc di
    loop clear_arrays
    
    ; Posiziona mine casuali (3 mine)
    mov cx, 3              ; Vogliamo posizionare 3 mine
place_mine:
    push cx
    
    ; Genera numero casuale tra 0 e 24
    mov ah, 00h           ; Interrupt per ottenere il timer
    int 1Ah              ; DX contiene il conteggio del timer
    mov ax, dx
    mov dx, 0
    mov bx, 25           ; Dividi per 25 per ottenere un numero tra 0 e 24
    div bx
    ; Il resto è in DX
    
    ; Verifica se c'è già una mina in quella posizione
    mov di, dx
    cmp mine[di], 1
    je skip_mine         ; Se c'e' gia' una mina, riprova
    
    ; Posiziona la mina
    mov mine[di], 1
    
skip_mine:
    pop cx
    loop place_mine
    
    ; Reset posizione cursore
    mov pos_x, 1
    mov pos_y, 1
    
    pop di
    pop cx
    pop ax
    ret
reset_game endp

aggiorna_schermo proc
    push ax
    push bx
    push cx
    push dx
        
        ; Pulisci schermo
        mov ax, 0003h
        int 10h
        
        ; Disegna campo base
        mov ah, 09h
        lea dx, mines_campo
        int 21h 
        
        ; Mostra saldo e puntata attuali
        lea dx, mines_saldo
        mov ah, 9
        int 21h
        
        mov ax, saldo
        call mostra_numero
        
        ; Mostra puntata corrente
        mov ah, 9
        lea dx, mines_vincita
        int 21h
        
        mov ax, vincita
        call mostra_numero
        
        ; Disegna caselle aperte
        mov cx, 25        ; Numero totale di caselle (5x5)
        mov di, 0         ; Indice dell'array caselle_aperte
    draw_cells:
        ; Calcola x,y
        mov ax, di
        mov bl, 5
        div bl           ; AL = riga, AH = colonna
        
        ; Posiziona il cursore
        mov dh, al       ; Riga (y)
        add dh, 2        ; Offset per allineamento
        mov dl, ah       ; Colonna (x)
        add dl, 6        ; Offset per allineamento
        mov bh, 0        ; Pagina video
        mov ah, 02h
        int 10h
        
        ; Verifica se la casella è aperta
        cmp caselle_aperte[di], 1
        jne skip_x
        
        ; Disegna X se la casella è aperta
        mov ah, 02h
        mov dl, 'X'
        int 21h
        
    skip_x:
        inc di
        loop draw_cells
        
        ; Posiziona il cursore sulla casella corrente
        mov ah, 02h
        mov bh, 0
        mov dh, pos_y
        add dh, 1        ; Offset per allineamento
        mov dl, pos_x
        add dl, 5        ; Offset per allineamento
        int 10h
        
        pop dx
        pop cx
        pop bx
        pop ax
        ret
aggiorna_schermo endp      
; -----------------------------------

; --- GESTIONE DELLA CALCOLATRICE ---
comando_calc:
    ; Pulisci lo schermo e il registro flag di  
    call cls
    push di
    
    ; Mostra il messaggio 
    lea dx, calc_msg
    mov ah, 9
    int 21h
    
    ; Attendi l'input
    mov ah,8
    int 21h
    
    ; Se viene inserito CTRL+C, esci dalla calcolatrice
    cmp al, 3
    je main
    
    ; Converte il carattere ASCII in numero
    sub al, '0'
    
    ; Salta all'operazione corrispondente
    cmp al, 1
    je somma
    cmp al, 2
    je sottrazione
    cmp al, 3
    je moltiplicazione
    cmp al, 4
    je divisione
    cmp al, 5
    je potenza
    cmp al, 6
    je radice
    cmp al, 7
    je logaritmo
    
    ; Se l'input non è valido, torna al main
    jmp main

somma:
    ; Chiedi primo numero
    lea dx, num1_msg
    mov ah, 9
    int 21h
    
    ; Leggi primo numero
    call leggi_numero
    mov num1, ax
    
    ; Chiedi secondo numero
    lea dx, num2_msg
    mov ah, 9
    int 21h
    
    ; Leggi secondo numero
    call leggi_numero
    mov num2, ax
    
    ; Calcola somma
    mov ax, num1
    add ax, num2
    mov result, ax
    
    ; Mostra risultato
    lea dx, result_msg
    mov ah, 9
    int 21h
    
    mov ax, result
    call mostra_numero
    
    lea dx, pkey
    mov ah, 9
    int 21h
    
    ; Attendi un tasto
    mov ah, 7
    int 21h
    
    jmp comando_calc

sottrazione:
    ; Chiedi primo numero
    lea dx, num1_msg
    mov ah, 9
    int 21h
    
    ; Leggi primo numero
    call leggi_numero
    mov num1, ax
    
    ; Chiedi secondo numero
    lea dx, num2_msg
    mov ah, 9
    int 21h
    
    ; Leggi secondo numero
    call leggi_numero
    mov num2, ax
    
    ; Calcola sottrazione
    mov ax, num1
    sub ax, num2
    mov result, ax
    
    ; Mostra risultato
    lea dx, result_msg
    mov ah, 9
    int 21h
    
    mov ax, result
    call mostra_numero
    
    lea dx, pkey
    mov ah, 9
    int 21h
    
    ; Attendi un tasto
    mov ah, 7
    int 21h
    
    jmp comando_calc

moltiplicazione:
    ; Chiedi primo numero
    lea dx, num1_msg
    mov ah, 9
    int 21h
    
    ; Leggi primo numero
    call leggi_numero
    mov num1, ax                            
    
    ; Chiedi secondo numero
    lea dx, num2_msg
    mov ah, 9
    int 21h
    
    ; Leggi secondo numero
    call leggi_numero
    mov num2, ax
    
    ; Calcola moltiplicazione
    mov ax, num1
    mov bx, num2
    mul bx
    mov result, ax
    
    ; Mostra risultato
    lea dx, result_msg
    mov ah, 9
    int 21h
    
    mov ax, result
    call mostra_numero
    
    lea dx, pkey
    mov ah, 9
    int 21h
    
    ; Attendi un tasto
    mov ah, 7
    int 21h
    
    jmp comando_calc

divisione:
    ; Chiedi primo numero
    lea dx, num1_msg
    mov ah, 9
    int 21h
    
    ; Leggi primo numero
    call leggi_numero
    mov num1, ax
    
    ; Chiedi secondo numero
    lea dx, num2_msg
    mov ah, 9
    int 21h
    
    ; Leggi secondo numero
    call leggi_numero
    mov num2, ax
    
    ; Verifica divisione per zero
    cmp ax, 0
    je errore_div_zero
    
    ; Calcola divisione
    mov dx, 0
    mov ax, num1
    div num2
    mov result, ax
    mov decimal_part, dx
    
    ; Mostra risultato
    lea dx, result_msg
    mov ah, 9
    int 21h
    
    mov ax, result
    call mostra_numero
    
    lea dx, pkey
    mov ah, 9
    int 21h
    
    ; Attendi un tasto
    mov ah, 7
    int 21h
    
    jmp comando_calc

errore_div_zero:
    lea dx, error_msg
    mov ah, 9
    int 21h
    
    lea dx, pkey
    mov ah, 9
    int 21h
    
    ; Attendi un tasto
    mov ah, 7
    int 21h
    
    jmp comando_calc

potenza:
    ; Chiedi base
    lea dx, num1_msg
    mov ah, 9
    int 21h
    
    ; Leggi base
    call leggi_numero
    mov num1, ax
    
    ; Chiedi esponente
    lea dx, num2_msg
    mov ah, 9
    int 21h
    
    ; Leggi esponente
    call leggi_numero
    mov num2, ax
    
    ; Calcola potenza
    mov cx, ax      ; Contatore esponente
    mov ax, 1       ; Risultato iniziale
    mov bx, num1    ; Base
    
potenza_loop:
    cmp cx, 0
    je fine_potenza
    mul bx
    dec cx
    jmp potenza_loop
    
fine_potenza:
    mov result, ax
    
    ; Mostra risultato
    lea dx, result_msg
    mov ah, 9
    int 21h
    
    mov ax, result
    call mostra_numero
    
    lea dx, pkey
    mov ah, 9
    int 21h
    
    ; Attendi un tasto
    mov ah, 7
    int 21h
    
    jmp comando_calc

radice:
    ; Chiedi numero
    lea dx, num1_msg
    mov ah, 9
    int 21h
    
    ; Leggi numero
    call leggi_numero
    mov num1, ax
    
    ; Calcola radice quadrata usando il metodo babilonese
    mov ax, num1    ; Numero di cui calcolare la radice
    mov bx, ax      ; Prima approssimazione = n
    shr bx, 1       ; Dividi per 2 per migliorare la prima approssimazione
    
    mov cx, 10      ; Numero di iterazioni
    
radice_loop:
    push cx         ; Salva il contatore
    
    mov cx, bx      ; Salva l'approssimazione corrente
    
    mov ax, num1    ; ax = n
    mov dx, 0       ; Prepara la divisione
    div bx          ; ax = n/x
    
    add ax, cx      ; ax = x + n/x
    shr ax, 1       ; ax = (x + n/x)/2
    
    mov bx, ax      ; Aggiorna l'approssimazione
    
    pop cx          ; Ripristina il contatore
    loop radice_loop
    
    mov result, ax
    
    ; Mostra risultato
    lea dx, result_msg
    mov ah, 9
    int 21h
    
    mov ax, result
    call mostra_numero
    
    lea dx, pkey
    mov ah, 9
    int 21h
    
    ; Attendi un tasto
    mov ah, 7
    int 21h
    
    jmp comando_calc

logaritmo:
    ; Chiedi numero
    lea dx, num1_msg
    mov ah, 9
    int 21h
    
    ; Leggi numero
    call leggi_numero
    mov num1, ax
    
    ; Calcola logaritmo naturale approssimato
    mov cx, 0       ; Contatore
    mov ax, num1
    
logaritmo_loop:
    cmp ax, 1
    jle fine_logaritmo
    shr ax, 1       ; Dividi per 2
    inc cx
    jmp logaritmo_loop
    
fine_logaritmo:
    mov result, cx
    
    ; Mostra risultato
    lea dx, result_msg
    mov ah, 9
    int 21h
    
    mov ax, result
    call mostra_numero
    
    lea dx, pkey
    mov ah, 9
    int 21h
    
    ; Attendi un tasto
    mov ah, 7
    int 21h
    
    jmp comando_calc

; Procedure per leggere un numero da input
leggi_numero proc
    push bx
    push cx
    push dx
    
    xor bx, bx      ; Azzera risultato
    mov cx, 10      ; Moltiplicatore
    
leggi_cifra:
    mov ah, 1
    int 21h
    
    cmp al, 13      ; Se ENTER, termina
    je fine_lettura
    
    sub al, '0'     ; Converti da ASCII a numero
    xor ah, ah
    push ax         ; Salva cifra
    
    mov ax, bx      ; Moltiplica numero corrente per 10
    mul cx
    mov bx, ax
    
    pop ax          ; Recupera cifra
    add bx, ax      ; Aggiungi cifra al numero
    
    jmp leggi_cifra
    
fine_lettura:
    mov ax, bx      ; Sposta risultato in AX
    
    pop dx
    pop cx
    pop bx
    ret
leggi_numero endp

; Procedure per mostrare un numero
mostra_numero proc
    push ax
    push bx
    push cx
    push dx
    
    mov bx, 10      ; Divisore
    xor cx, cx      ; Contatore cifre
    
    ; Gestisci caso speciale numero = 0
    cmp ax, 0
    jne dividi_numero
    push 0
    inc cx
    jmp mostra_cifre
    
dividi_numero:
    cmp ax, 0
    je mostra_cifre
    
    xor dx, dx
    div bx          ; Dividi per 10
    push dx         ; Salva resto (cifra)
    inc cx          ; Incrementa contatore
    jmp dividi_numero
    
mostra_cifre:
    pop dx          ; Recupera cifra
    add dl, '0'     ; Converti in ASCII
    mov ah, 2       ; Stampa carattere
    int 21h
    loop mostra_cifre
    
    mov dl, 13      ; Carriage return
    mov ah, 2
    int 21h
    mov dl, 10      ; Line feed
    mov ah, 2
    int 21h
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret
mostra_numero endp 
    
    
; --- GESTIONE DEL CAMBIO PASSWORD ---
comando_pwd:
    ; Chiedi vecchia password
    lea dx, old_pwd_msg
    mov ah, 9
    int 21h
    
    xor si, si
    
ottieni_vpwd:
    mov ah, 8
    int 21h
    
    cmp al, 13
    je controlla_vpwd
    
    cmp al, 8
    je handler_vpwd
    
    cmp si, 19
    jae ottieni_vpwd
    
    mov password[si], al
    inc si
    
    lea dx, asterisco
    mov ah, 9
    int 21h
    
    jmp ottieni_vpwd
    
handler_vpwd:
    cmp si, 0
    je ottieni_vpwd
    
    lea dx, backspace
    mov ah, 9
    int 21h
    
    dec si
    mov password[si], 0
    
    jmp ottieni_vpwd
    
controlla_vpwd:
    mov password[si], '$'
    
    ; Verifica vecchia password
    call controlla_credenziali
    cmp al, 1
    jne pwd_error
    
    ; Chiedi nuova password
    lea dx, new_pwd_msg
    mov ah, 9
    int 21h
    
    xor si, si
    
ottieni_npwd:
    mov ah, 8
    int 21h
    
    cmp al, 13
    je salva_npwd
    
    cmp al, 8
    je handler_npwd
    
    cmp si, 19
    jae ottieni_npwd
    
    mov new_password[si], al
    inc si
    
    lea dx, asterisco
    mov ah, 9
    int 21h
    
    jmp ottieni_npwd
    
handler_npwd:
    cmp si, 0
    je ottieni_npwd
    
    lea dx, backspace
    mov ah, 9
    int 21h
    
    dec si
    mov new_password[si], 0
    
    jmp ottieni_npwd
    
salva_npwd:
    mov new_password[si], '$'
    
    ; Chiedi conferma password
    lea dx, confirm_pwd_msg
    mov ah, 9
    int 21h
    
    xor si, si
    
ottieni_cpwd:
    mov ah, 8
    int 21h
    
    cmp al, 13
    je controlla_cpwd
    
    cmp al, 8
    je handler_cpwd
    
    cmp si, 19
    jae ottieni_cpwd
    
    mov confirm_password[si], al
    inc si
    
    lea dx, asterisco
    mov ah, 9
    int 21h
    
    jmp ottieni_cpwd
    
handler_cpwd:
    cmp si, 0
    je ottieni_cpwd
    
    lea dx, backspace
    mov ah, 9
    int 21h
    
    dec si
    mov confirm_password[si], 0
    
    jmp ottieni_cpwd
    
controlla_cpwd:
    mov confirm_password[si], '$'
    
    ; Confronta nuova password e conferma
    mov si, 0
    
confronta_pwd:
    mov al, new_password[si]
    mov bl, confirm_password[si]
    
    cmp al, '$'
    je termina_controlla_pwd
    
    cmp al, bl
    jne pwd_mismatch
    
    inc si
    jmp confronta_pwd
    
termina_controlla_pwd:
    cmp bl, '$'
    jne pwd_mismatch
    
    ; Aggiorna la password
    mov si, 0
aggiorna_pwd:
    mov al, new_password[si]
    mov valid_pwd[si], al
    
    cmp al, '$'
    je pwd_aggiornata
    
    inc si
    jmp aggiorna_pwd
    
pwd_aggiornata:
    lea dx, pwd_success_msg
    mov ah, 9
    int 21h
    
    call cls
    jmp start
    
pwd_error:
    lea dx, pwd_error_msg
    mov ah, 9
    int 21h
    jmp scrivi_prompt
    
pwd_mismatch:
    lea dx, pwd_mismatch_msg
    mov ah, 9
    int 21h
    jmp scrivi_prompt
         
termina_programma:
    mov ax, 4c00h
    int 21h


; --- ALTRE SUBROUTINES ---    
; Subroutine per verificare le credenziali
controlla_credenziali proc
    mov si, 0
    
    ; Controlla nome utente per ogni carattere
    cu:
    mov al, username[si]
    mov bl, valid_user[si]
    cmp al, '$'               ; Se l'utente inserito termina
    je cu_termina             ; controlla anche se quello valido termina
    cmp al, bl
    jne auth_fallita
    inc si
    jmp cu
    
    cu_termina:
    cmp bl, "$"
    jne auth_fallita
    
    mov si, 0
    
    ; Controlla password
    cp:
    mov al, password[si]
    mov bl, valid_pwd[si] 
    cmp al, '$'
    je cp_termina
    cmp al, bl
    jne auth_fallita
    inc si
    jmp cp
    
    cp_termina:
    cmp bl, "$"
    jne auth_fallita
    
    mov al, 1                ; Ritorna con il valore 1 se l'autenticazione e' riuscita
    ret
    
    auth_fallita:
    mov al, 0
    ret
    
controlla_credenziali endp
    
; Subroutine per pulire lo schermo
cls proc
    mov ax, 0600h
    mov bh, 07h
    mov cx, 0000h
    mov dx, 184Fh
    int 10h
    
    mov ah, 02h
    mov bh, 00h
    mov dx, 0000h
    int 10h
    ret
cls endp

; Subroutine per confrontare stringhe
compare_strings proc
    push cx
    push si
    push di
    
compare_loop:
    mov al, [si]
    mov bl, [di]
    
    ; Se entrambi i caratteri sono 0 o spazio, è un match
    cmp bl, 0
    je check_end_or_space
    
    ; Confronta i caratteri
    cmp al, bl
    jne strings_different
    
    inc si
    inc di
    jmp compare_loop
    
check_end_or_space:
    ; Verifica se il carattere corrente è uno spazio o fine stringa
    cmp al, 0
    je strings_equal
    cmp al, ' '
    je strings_equal
    
strings_different:
    mov ax, 0
    jmp end_compare
    
strings_equal:
    mov ax, 1
    
end_compare:
    pop di
    pop si
    pop cx
    ret
compare_strings endp
ends
end start