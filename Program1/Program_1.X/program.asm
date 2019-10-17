    #INCLUDE <p16f84.inc>
    ORG 0x00

Start
    BSF STATUS, RP0
    CLRF TRISA
    MOVLW 0xFF
    MOVWF TRISB
    BCF STATUS, RP0

Main
    MOVLW .150
    SUBWF PORTB, W
    BTFSS STATUS, Z
    GOTO Different

Equal
    MOVLW .1
    MOVWF W
    GOTO Main

Different
    BTFSS STATUS, C
    GOTO Less

Greater
    MOVLW .4
    MOVWF PORTA
    GOTO Main

Less
    MOVLW .2
    MOVWF PORTA
    GOTO Main
    END
    
    


    
