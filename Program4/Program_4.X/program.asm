    #INCLUDE <p16f84.inc>
    ORG 0x00

    CBLOCK
    Number
    ENDC

Start
    BSF STATUS, RP0
    MOVLW 0x0F
    MOVWF TRISB
    CLRF TRISA
    BCF STATUS, RP0

Main
    MOVF PORTA, W
    MOVWF Number
    SWAPF Number, W
    ANDLW 0x0F
    MOVWF Number
    MOVF PORTB, W
    ANDLW 0x0F
    ADDWF Number, W
    MOVWF PORTA
    GOTO Main

    END



