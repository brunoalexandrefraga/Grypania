    #INCLUDE <p16f84.inc>
    ORG 0x00
Start
    BSF STATUS, RP0
    CLRF TRISB
    BCF STATUS, RP0

Main
    MOVLW .1
    MOVWF PORTB
    BCF STATUS, C

LoopL
    RLF PORTB, F
    BTFSS PORTB, 7
    GOTO LoopL

LoopR
    RRF PORTB, F
    BTFSS PORTB, 0
    GOTO LoopR
    GOTO LoopL

    END


