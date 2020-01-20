    #INCLUDE <p16f84.inc>
    ORG 0x00

Start
    BSF STATUS, RP0
    CLRF TRISA
    MOVLW 0x00
    MOVWF TRISB
    BCF STATUS, RP0

Main
    MOVLW .150
    SUBWF PORTB, W
    BTFSS STATUS, Z
    GOTO Different

Equal
    BSF PORTA, 0
    GOTO Main

Different
    BCF PORTA, 1
    GOTO Main
    
    END
 

