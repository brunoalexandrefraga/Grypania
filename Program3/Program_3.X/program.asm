    #INCLUDE <p16f84.inc>
    ORG 0x00

Start
    BSF STATUS, RP0
    CLRF TRISB
    MOVLW .1
    MOVWF TRISA
    BCF STATUS, RP0
    
Main
   CLRF PORTB
   BCF STATUS, C

Left
    BTFSS PORTA, 0
    BSF STATUS, C
    RLF PORTB, F
    BTFSS PORTB, 7
    GOTO Left
    CLRF PORTB

Right
    BTFSS PORTA, 0
    BSF STATUS, C
    RRF PORTB, F
    BTFSS PORTB, 0
    GOTO Right
    GOTO Main

    END
