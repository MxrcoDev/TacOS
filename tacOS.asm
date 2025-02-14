; multi-segment executable file template.
data segment
    ; add your data here!
    pkey db " ", 13, 10
         db "Premi qualsiasi tasto per continuare...$"
    
    ; MESSAGGI DI SISTEMA
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
            db "         Benvenuto su tacOS v8.1       ", 13, 10
            db "       Sviluppato da MxrcoDev, 3D.    ", 13, 10
            db "  Digita 'help' per maggiori informazioni  ", 13, 10  
            db "", 13, 10
            db "        github.com/MxrcoDev/TacOS", 13, 10, "$"
    newline db " ", 13, 10, "$"
    space   db " $"
            
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
                db 13, 10, "help       --> Mostra la lista dei comandi", 13, 10
                db "exit       --> Torna alla schermata di login", 13, 10
                db "pwd        --> Cambia password", 13, 10
                db "cls        --> Pulisci lo schermo", 13, 10
                db "calc       --> Apri la calcolatrice", 13, 10
                db "mines      --> Apri il gioco 'mines'", 13, 10
                db "shutdown   --> Spegni il sistema", 13, 10
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
                db "7. Logaritmo in base 2", 13, 10
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
    neg_msg   db 13, 10              
              db 13, 10
              db 13, 10                
              db "    Errore! Math error.$"  
            
    
    ; MEMORIA
    username db 20 dup(0)    
    password db 20 dup(0)    
    new_password db 20 dup(0)    
    confirm_password db 20 dup(0)
    cmd_buffer   db 50 dup(0)
    cmd_size     db 0
    
    num1 dw 0
    num2 dw 0
    result dw 0
    decimal_part dw 0
    calc_buff db 10 dup(0)
    
    
    ; COMMAND HANDLER
    ;
    ;-----------------
    help_cmd     db "help", 0
    exit_cmd     db "exit", 0
    pwd_cmd      db "pwd", 0
    cls_cmd      db "cls", 0
    calc_cmd     db "calc", 0
    mines_cmd    db "mines", 0
    shutdown_cmd db "shutdown", 0  
    ; aggiungi qui i tuoi comandi
    ;-----------------
    
    
    ; STRINGHE DI SUPPORTO
    asterisco db "*$"
    backspace db 8, ' ', 8, "$" 
    
    ; CREDENZIALI ALLO STARTUP
    valid_user db "admin$"
    valid_pwd  db "admin$"
    
    ; MESSAGGI MINES
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
    mine db 25 dup(0)            ; Mappa mine
    
    
    termina_msg db "     Grazie per aver usato TacOS!", 13, 10
                db "", 13, 10
                db "             /--\", 13, 10 
                db "      _(\    |@@|", 13, 10
                db "     (__/\__ \--/ __", 13, 10
                db "        \___|----|  |   __", 13, 10
                db "            \ }{ /\ )_ / _\", 13, 10
                db "            /\__/\ \__O (__", 13, 10
                db "           (--/\--)    \__/", 13, 10
                db "           _)(  )(_", 13, 10
                db "          `---''---`", 13, 10
                db "", 13, 10
                db "     Realizzato con cura da MxrcoDev", 13, 10
                db " ", 13, 10 
                db "        github.com/MxrcoDev/TacOS$", 13, 10
                
    areyousure  db "Sei sicuro di voler terminare il programma? (s / n)$"
    
    
    
    
    
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
    
    
    
; /-------------------\    
; |                   |
; |   SEZIONE LOGIN   |
; |                   |
; \-------------------/ 
   
utente:
    mov ah, 8       
    int 21h
    
    ; Invio
    cmp al, 13
    je ottieni_utente
    
    ; Se il tasto premuto e' backspace
    cmp al, 8
    je handler_utente
    
    ; Controlla se abbiamo raggiunto il limite del buffer
    cmp si, 19      
    jae utente
    
    ; Memorizza e mostra il carattere
    mov username[si], al
    inc si
    
    mov dl, al
    mov ah, 2
    int 21h
    
    jmp utente

; Handler per il backspace
handler_utente:
    ; Controlla se e' stato inserito almeno un carattere
    cmp si, 0
    je utente    
    
    ; Cancella l'ultimo carattere digitato
    lea dx, backspace
    mov ah, 9
    int 21h
    
    dec si          ; Decrementa l'indice del buffer
    mov username[si], 0   ; Cancella l'ultimo carattere dal buffer
    
    jmp utente
    
ottieni_utente:
    mov username[si], '$'
    
    ; Mostra il prompt password
    lea dx, pwdmsg
    mov ah, 9
    int 21h
    
    xor si, si
    
pwd:
    mov ah, 8
    int 21h
    
    cmp al, 13
    je ottieni_pwd
    
    cmp al, 8
    je handler_pwd
    
    cmp si, 19
    jae pwd
    
    mov password[si], al
    inc si
    
    lea dx, asterisco
    mov ah, 9
    int 21h
    jmp pwd
    
handler_pwd:
    cmp si, 0
    je pwd
    
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
    
    xor si, si
    
    jmp utente
    
    
    
    
; /-------------------\    
; |                   |
; |    SEZIONE DOS    |
; |                   |
; \-------------------/
 
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
        
    lea dx, prompt
    mov ah, 9
    int 21h
    
    xor si, si
    
prompt_cmd:
    mov ah, 8       
    int 21h
    
    cmp al, 13
    je ottieni_cmd
    
    cmp al, 8
    je handler_cmd
    
    cmp si, 49      
    jae prompt_cmd
    
    mov cmd_buffer[si], al
    inc si
    
    mov dl, al
    mov ah, 2
    int 21h
    
    jmp prompt_cmd
    
handler_cmd:
    cmp si, 0
    je prompt_cmd
    
    lea dx, backspace
    mov ah, 9
    int 21h
    
    dec si
    mov cmd_buffer[si], 0
    
    jmp prompt_cmd

ottieni_cmd:
    mov cmd_buffer[si], 0
    
    ; Comando help
    lea si, cmd_buffer
    lea di, help_cmd
    call compare_strings
    cmp ax, 1
    je comando_help
    
    ; Comando exit
    lea si, cmd_buffer
    lea di, exit_cmd
    call compare_strings
    cmp ax, 1
    je comando_exit
    
    ; Comando pwd
    lea si, cmd_buffer
    lea di, pwd_cmd
    call compare_strings
    cmp ax, 1
    je comando_pwd 
    
    ; Comando cls
    lea si, cmd_buffer
    lea di, cls_cmd
    call compare_strings
    cmp ax, 1
    je comando_cls
    
    ; Comando calc
    lea si, cmd_buffer
    lea di, calc_cmd
    call compare_strings
    cmp ax, 1
    je comando_calc
    
    ; Comando mines
    lea si, cmd_buffer
    lea di, mines_cmd
    call compare_strings
    cmp ax, 1
    je comando_mines
    
    ; Comando shutdown
    lea si, cmd_buffer
    lea di, shutdown_cmd
    call compare_strings
    cmp ax, 1
    je termina_programma
    
    ; AGGIUNGI COMANDO
    ; lea si, cmd_buffer
    ; lea di, COMANDO
    ; call compare_strings
    ; cmp ax, 1
    ; je termina_programma
    
    ; Comando non riconosciuto
    lea dx, sconosciuto
    mov ah, 9
    int 21h
    jmp scrivi_prompt



; /-------------------\    
; |                   |
; |  SEZIONE COMANDI  |
; |                   |
; \-------------------/ 

; --- HELP ---
comando_help:
    lea dx, help_msg
    mov ah, 9
    int 21h 
    jmp scrivi_prompt

; --- EXIT ---
comando_exit:
    call cls
    jmp start

; --- CLS ---
comando_cls:
    jmp main

; --- MINES ---
comando_mines:
        call cls
        
        lea dx, mines_logo
        mov ah, 9
        int 21h
        
        lea dx, mines_premitasto
        mov ah, 9
        int 21h
        
        mov ah, 8
        int 21h
        
        ; CTRL+C
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
        call cls
        
        lea dx, mines_logo
        mov ah, 9
        int 21h
        
        lea dx, mines_saldo
        mov ah, 9
        int 21h
        
        xor ah, ah
        mov ax, saldo
        call mostra_numero
        
        lea dx, mines_puntata
        mov ah, 9
        int 21h
        
    ; leggi la puntata
    get_bet:
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
    
    ; --- LOGICA MINES ---    
    game_loop:
        call aggiorna_schermo
        
        mov ah, 8
        int 21h
        
        cmp al, 13          ; Invio (Cashout)
        je cashout
        cmp al, 32          ; Spazio (Seleziona)
        je controlla_casella
        cmp al, 3           ; CTRL+C (Esci)
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
        ; Calcola indice della casella
        ;                                       
        ; INDICE = (pos_y - 1) * 5 + (pos_x - 1)
         
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
        
        ; Segna come casella aperta
        mov caselle_aperte[bx], 1
        inc contatore_caselle
        
        ; Verifica presenza mina
        cmp mine[bx], 1
        je boom
        
        ; Ogni due caselle, verifica vittoria
        mov al, contatore_caselle
        mov bl, 2
        div bl
        cmp ah, 0
        je win
        
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
            
        call reset_game    ; Ripristina gioco
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
    mov ah, 8
    int 21h
    
    cmp al, 1
    je fine_input
    
    cmp al, 13
    je fine_input
    
    cmp al, 3
    je main
    
    cmp al, 8
    je gestisci_backspace
    
    ; I caratteri devono essere compresi tra 0 e 9
    cmp al, '0'
    jb input_loop
    cmp al, '9'
    ja input_loop
    
    sub al, '0'     ; Converti ASCII in numero
    xor ah, ah
    
    push ax
    
    ; Moltiplica la puntata accumulata per 10
    ; In modo da scorrere per aggiungere una nuova cifra
    mov ax, bx
    mov cx, 10
    mul cx
    
    pop dx          
    add ax, dx
    
    cmp ax, 65535   ; Verifica overflow
    ja input_loop
    
    ; Verifica se supera il saldo
    cmp ax, word ptr [saldo] ; Si usa per verificare l'ampiezza del dato
    ja input_loop
    
    mov bx, ax      ; Aggiorna la puntata accumulata
    
    ; Mostra il carattere
    add dl, '0'     
    mov ah, 2      
    int 21h
    
    jmp input_loop
    
gestisci_backspace:
    cmp bx, 0
    je input_loop
    
    lea dx, backspace
    mov ah, 9
    int 21h
    
    ; Rimuovi l'ultima cifra
    ; dividendo per 10
    ; (i numeri sono int)
    mov ax, bx
    mov cx, 10
    xor dx, dx
    div cx
    mov bx, ax      
    
    jmp input_loop
    
fine_input:
    mov ax, bx
    
    pop dx
    pop cx
    pop bx
    ret
leggi_puntata endp


reset_game proc
    push ax
    push cx
    push di
    
    ; Resetta il contatore e la vincita
    mov contatore_caselle, 0
    mov vincita, 0
    
    mov cx, 25
    mov di, 0
    
clear_arrays: 

    ; resetta gli array
    mov caselle_aperte[di], 0
    mov mine[di], 0
    inc di
    loop clear_arrays
    
    ; Posiziona mine casuali (3 mine)
    mov cx, 3
    
place_mine:
    push cx
    
    ; Genera numero casuale tra 0 e 24
    
    mov ah, 00h           ; Interrupt per ottenere il timer
    int 1Ah               ; DX contiene il conteggio del timer
    mov ax, dx
    mov dx, 0
    mov bx, 25           ; Dividi per 25 per ottenere un numero tra 0 e 24
    div bx
    
    ; Verifica se c'e' gia' una mina in quella posizione
    mov di, dx
    cmp mine[di], 1
    je skip_mine
    
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
        
    call cls
        
    mov ah, 09h
    lea dx, mines_campo
    int 21h 
        
    lea dx, mines_saldo
    mov ah, 9
    int 21h
        
    mov ax, saldo
    call mostra_numero
        
    mov ah, 9
    lea dx, mines_vincita
    int 21h
        
    mov ax, vincita
    call mostra_numero
        
    ; Disegna caselle
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
        mov bh, 0        
        mov ah, 02h
        int 10h
        
        ; Verifica se la casella e' aperta
        cmp caselle_aperte[di], 1
        jne skip_x
        
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
              
              
              
; /-------------------\    
; |                   |
; |   SEZIONE CALC    |
; |                   |
; \-------------------/
 
comando_calc: 
    call cls
    push di
    
calc_menu:
    lea dx, calc_msg
    mov ah, 9
    int 21h
    
    mov ah, 8
    int 21h
    
    cmp al, 3
    je main
    
    sub al, '0'
    
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
    
    jmp comando_calc

somma:
    ; Chiedi primo numero
    lea dx, num1_msg
    mov ah, 9
    int 21h
    
    call leggi_numero
    mov num1, ax
    
    ; Chiedi secondo numero
    lea dx, num2_msg
    mov ah, 9
    int 21h
    
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
    
    ; Attendi un tasto
    mov ah, 7
    int 21h
    
    jmp comando_calc

sottrazione:
    ; Chiedi primo numero
    lea dx, num1_msg
    mov ah, 9
    int 21h
    
    call leggi_numero
    mov num1, ax
    
    ; Chiedi secondo numero
    lea dx, num2_msg
    mov ah, 9
    int 21h
    
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
    
    mov ah, 7
    int 21h
    
    jmp comando_calc

moltiplicazione:
    ; Chiedi primo numero
    lea dx, num1_msg
    mov ah, 9
    int 21h
    
    call leggi_numero
    mov num1, ax
    
    ; Chiedi secondo numero
    lea dx, num2_msg
    mov ah, 9
    int 21h
    
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
    
    mov ah, 7
    int 21h
    
    jmp comando_calc

divisione:
    ; Chiedi primo numero
    lea dx, num1_msg
    mov ah, 9
    int 21h
    
    call leggi_numero
    mov num1, ax
    
    ; Chiedi secondo numero
    lea dx, num2_msg
    mov ah, 9
    int 21h
    
    call leggi_numero
    mov num2, ax
    
    ; Verifica divisione per zero
    cmp ax, 0
    je errore_div_zero
    
    ; Calcola divisione
    mov ax, num1
    cwd             ; Converte word in double word con segno
    idiv num2       ; Divisione con segno
    mov result, ax
    
    ; Mostra risultato
    lea dx, result_msg
    mov ah, 9
    int 21h
    
    mov ax, result
    call mostra_numero
    
    mov ah, 7
    int 21h
    
    jmp comando_calc

errore_div_zero:
    lea dx, error_msg
    mov ah, 9
    int 21h
    
    mov ah, 7
    int 21h
    
    jmp comando_calc

potenza:
    ; Chiedi base
    lea dx, num1_msg
    mov ah, 9
    int 21h
    
    call leggi_numero
    mov num1, ax
    
    ; Chiedi esponente
    lea dx, num2_msg
    mov ah, 9
    int 21h
    
    call leggi_numero
    
    ; Verifica che l'esponente sia positivo
    test ax, ax
    js errore_neg
    
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
    
    mov ah, 7
    int 21h
    
    jmp comando_calc

radice:
    ; Chiedi l'argomento della radice
    lea dx, num1_msg
    mov ah, 9
    int 21h
    
    call leggi_numero
    
    ; Verifica che il numero sia positivo
    test ax, ax
    js errore_neg
    
    mov num1, ax
    
    ; Calcola radice quadrata usando il metodo babilonese
    ;
    ; Xn+1 = (Xn + S/Xn) / 2 
    ;
    ; Xn => Stima della radice
    ; S  => Numero di cui calcolare la radice
    
    mov ax, num1    ; S
    mov bx, ax      ; Xn
    shr bx, 1       ; /2
    
    mov cx, 10      ; Numero di iterazioni
    
radice_loop:
    push cx         
    
    mov cx, bx      
    
    mov ax, num1    ; S
    mov dx, 0       
    div bx          ; Xn
    
    add ax, cx      ; Xn + S/Xn
    shr ax, 1       ; /2
    
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
    
    mov ah, 7
    int 21h
    
    jmp comando_calc

logaritmo:
    ; Chiedi l'argomento del logaritmo
    lea dx, num1_msg
    mov ah, 9
    int 21h
    
    call leggi_numero
    
    ; Verifica che il numero sia positivo
    test ax, ax
    js errore_neg
    
    mov num1, ax
    
    ; Calcola logaritmo in base 2 approssimato
    ; 
    ; Xn+1 = Xn / 2
    
    mov cx, 0       
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
    
    mov ah, 7
    int 21h
    
    jmp comando_calc 

; L'argomento della radice o del logaritmo oppure l'esponente 
; della potenza e' negativo
errore_neg:
    lea dx, neg_msg
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
    push si
    
    xor bx, bx      ; Azzera risultato
    mov cx, 10      ; Moltiplicatore
    xor di, di      ; Flag per il segno (0 = positivo, 1 = negativo)
    
    xor si, si      ; Azzeriamo il contatore per il funzionamento del backspace
    
    mov ah, 1
    int 21h
    
    cmp al, '-'
    jne non_negativo
    mov di, 1       ; Imposta flag negativo
    jmp leggi_cifra
    
non_negativo:
    cmp al, 13      
    je fine_lettura
    
    cmp al, 8     
    je first_back   ; Se il primo numero inserito e' un backspace
    
    sub al, '0'     ; Converti da ASCII a numero
    xor ah, ah      ; Pulisci AH
    push ax         ; Salva cifra
    
    mov ax, bx      ; Moltiplica numero corrente per 10
    mul cx          ; in modo da farlo shiftare a destra
    mov bx, ax
    
    pop ax          ; Recupera cifra
    add bx, ax      ; Aggiungi cifra al numero
    
    
    inc si          ; Incrementa il contatore dei caratteri
    
leggi_cifra:
    mov ah, 8
    int 21h
    
    cmp al, 13      
    je fine_lettura 
    
    cmp al, 8       
    je handler_calc
    
    inc si          
    
    mov dl, al
    mov ah, 2
    int 21h
    
    sub al, '0'     
    xor ah, ah      
    push ax         
    
    mov ax, bx      
    mul cx          
    mov bx, ax
    
    pop ax          
    add bx, ax      
    
    jmp leggi_cifra

handler_calc:
    cmp si, 0
    je leggi_cifra
    
    lea dx, backspace
    mov ah, 9
    int 21h
    
    dec si
    
    jmp leggi_cifra

first_back:
    lea dx, space
    mov ah, 9
    int 21h
    
    pop dx
    pop cx
    pop bx
    pop si
    
    jmp leggi_numero
        
fine_lettura:
    mov ax, bx      ; Sposta risultato in AX
    
    ; Se il flag negativo e' impostato, nega il numero usando NEG
    cmp di, 1
    jne fine_proc
    neg ax          
    
fine_proc:
    pop dx
    pop cx
    pop bx
    pop si
    ret
leggi_numero endp

; Procedure per mostrare un numero in output
mostra_numero proc
    push ax
    push bx
    push cx
    push dx
    
    mov bx, 10      ; Divisore
    xor cx, cx      ; Contatore cifre
    
    ; Controlla se il numero e' negativo
    test ax, ax
    jns non_stampa_meno
    
    ; Stampa il segno meno e fai tornare positivo il numero
    push ax
    mov dl, '-'
    mov ah, 2
    int 21h
    pop ax
    neg ax          
    
non_stampa_meno:
    ; Gestisci caso speciale numero = 0
    cmp ax, 0
    jne dividi_numero
    push 0
    inc cx
    jmp mostra_cifre
    
dividi_numero:
    cmp ax, 0
    je mostra_cifre
    
    cwd             
    idiv bx         ; Divisione con segno
    push dx         
    inc cx          ; Incrementa contatore
    jmp dividi_numero
    
mostra_cifre:
    pop dx          
    add dl, '0'     
    mov ah, 2       
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
  
  
  
  
; /-------------------\    
; |                   |
; |    SEZIONE PWD    |
; |                   |
; \-------------------/ 

comando_pwd:
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
    call cls
    
    lea dx, areyousure
    mov ah, 9
    int 21h
    
    mov ah, 8
    int 21h
    
    cmp al, 115
    jne main
    
    call cls
    
    lea dx, termina_msg
    mov ah, 9
    int 21h
    
    xor dx, dx
    xor ax, ax
    
    mov ax, 4c00h
    int 21h


; /-------------------\    
; |                   |
; |   SEZIONE PROC    |
; |                   |
; \-------------------/ 
    
; --- CONTROLLA CREDENZIALI ---
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
    
; --- PULISCI SCHERMO ---
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

; --- CONFRONTA STRINGHE ---
compare_strings proc
    push cx
    push si
    push di
    
compare_loop:
    mov al, [si]
    mov bl, [di]
    
    ; Se entrambi i caratteri sono 0 o spazio, e' un match
    cmp bl, 0
    je check_end_or_space
    
    ; Confronta i caratteri
    cmp al, bl
    jne strings_different
    
    inc si
    inc di
    jmp compare_loop
    
check_end_or_space:
    ; Verifica se il carattere corrente e' uno spazio o fine stringa
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