    #INCLUDE <p16f84.inc>
    
    CBLOCK
    REGB
    REGC
    ENDC

    ORG 0x00

Start
    BSF STATUS, RP0
    MOVLW 0xFF
    MOVWF TRISB
    CLRF TRISA
    BCF STATUS, RP0

Main
    MOVF PORTB, W
    MOVWF REGB
    MOVWF REGC

By5
    MOVLW .5
    SUBWF REGC, F
    BTFSC STATUS, Z
    GOTO On5
    BTFSC STATUS, C
    GOTO By5
    BCF PORTA, 1

By4
    MOVLW .4
    SUBWF REGB, F
    BTFSC STATUS, Z
    GOTO On4
    BTFSC STATUS, C
    GOTO By4
    BCF PORTA, 0
    GOTO Main

On5
    BSF PORTA, 1
    GOTO By4

On4
    BSF PORTA, 0
    GOTO Main

    END


 


