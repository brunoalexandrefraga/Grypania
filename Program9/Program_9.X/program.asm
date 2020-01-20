    #INCLUDE <p16f84.inc>

    CBLOCK 0x0C
    L1
    L2
    L3
    M1
    M2
    M3
    N1
    N2
    N3
    Ak
    Bk
    Ck
    ENDC
    
    ORG 0x00
 
Start
    BTFSS PORTA, 4
    GOTO $-1
    MOVF PORTB, W
    MOVWF L1
    MOVWF L2
    MOVWF L3
    BTFSS PORTA, 4
    GOTO $-1
    MOVF PORTB, W
    MOVWF M1
    MOVWF M2
    MOVWF M3
    BTFSS PORTA, 4
    GOTO $-1
    MOVF PORTB, W
    MOVWF N1
    MOVWF N2
    MOVWF N3

    CLRF Ak
    CLRF Bk
    CLRF Ck

    RLF L1, F
    RLF L1, F
    RLF L1, F
    MOVLW b'00011000'
    ANDWF L1, W
    ADDWF Ak, F
    MOVLW b'11100000'
    ANDWF M1, W
    ADDWF Ak, F
    MOVLW b'00000111'
    ANDWF N1, W
    ADDWF Ak, F
    
    RLF L2, F
    RLF L2, F
    RLF M1, F
    RLF M1, F
    RRF N1, F
    RRF N1, F
    RRF N1, F
    RRF N1, F
    MOVLW b'11110000'
    ANDWF L2, W
    ADDWF Bk, F
    MOVLW b'00001100'
    ANDWF M2, W
    ADDWF Bk, F
    MOVLW b'00000011'
    ANDWF N2, W
    ADDWF Bk, F
    
    RLF M3, F
    RRF N3, F
    RRF N3, F
    RRF N3, F
    MOVLW b'11000000'
    ANDWF L3, W
    ADDWF Ck, F
    MOVLW b'00111000'
    ANDWF M3, W
    ADDWF Ck, F
    MOVLW b'00000111'
    ANDWF N3, W
    ADDWF Ck, F
    
    MOVF Ak, W
    MOVWF PORTA
    SWAPF Ak, F
    MOVF Ak, W
    MOVWF PORTA
    
    MOVF Bk, W
    MOVWF PORTA
    SWAPF Bk, F
    MOVF Bk, W
    MOVWF PORTA
    
    MOVF Ck, W
    MOVWF PORTA
    SWAPF Ck, F
    MOVF Ck, W
    MOVWF PORTA

    END