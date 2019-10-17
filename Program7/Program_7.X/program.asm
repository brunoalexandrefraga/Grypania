    #INCLUDE <p16f84.inc>
    ORG 0x00

    CBLOCK 0x0C
    Even
    Index
    ENDC

Start
    BSF STATUS, RP0
    MOVLW 0xFF
    MOVWF TRISB
    MOVLW b'10000'
    MOVWF TRISA
    BCF STATUS, RP0

Main
    BTFSS PORTA, 4
    GOTO $-1
    MOVLW .7
    MOVWF Index

Compute
    BTFSS PORTB, Index
    INCF Even, F
    DECFSZ Index
    MOVF Even, W
    MOVWF PORTA
    GOTO Main

    END


