    #INCLUDE <p16f84.inc>
    ORG 0x00
    
    CBLOCK 0X0C
    N
    ENDC

Start
    BSF STATUS, RP0
    MOVLW 0xFF
    MOVFW TRISB
    MOVLW b'11100'
    MOVWF TRISA
    BCF STATUS, RP0

Main
    CLRF PORTA
    BTFSS PORTA, 4
    GOTO $-1

Filled
    BSF PORTA, 1
    BCF PORTA, 0
    BTFSS PORTA, 3
    GOTO $-1

Empty
    BCF PORTA, 1
    BSF PORTA, 0
    BTFSC PORTA, 2
    GOTO $-1
    DECFSZ N, F
    GOTO Filled
    GOTO Main

    END



