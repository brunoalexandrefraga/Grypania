    #INCLUDE <p16f84.inc>

    CBLOCK 0x0C
    N1
    N2
    Result
    ENDC

    ORG 0x00

Start
    BSF STATUS, RP0
    MOVLW 0xFF
    MOVWF TRISB
    MOVLW 0x0E
    MOVWF TRISA
    BCF STATUS, RP0

Main
    BTFSS PORTA, 3
    GOTO $-1
    BTFSC PORTA, 3
    GOTO $-1
    MOVF PORTB, W
    MOVWF N1
    MOVWF N2
    SWAPF N2, F
    MOVLW 0x0F
    ANDWF N1, F
    ANDWF N2, F
    BTFSS PORTA, 2
    GOTO SumSub
    GOTO MulDiv

SumSub
    BTFSS PORTA, 1
    GOTO Sum
    GOTO Sub

MulDiv
    BTFSS PORTA, 1
    GOTO Mul
    GOTO Div

Sum
    MOVF N2, W
    ADDWF N1, W
    MOVWF Result
    GOTO Show

Sub
    MOVF N2, W
    SUBWF N1, W
    MOVWF Result
    GOTO Show

Mul
    MOVF N2, W
    DECFSZ N1
    ADDWF Result
    GOTO Show
Div
    MOVF N2, W
    SUBWF N1, W
    INCF Result, F
    BTFSC STATUS, C
    GOTO Div
    GOTO Show

Show
    MOVLW .7

Repeater
    MOVWF N1
    DECFSZ N1
    GOTO ShowBit
    GOTO Main

ShowBit
    MOVF Result, W
    MOVWF PORTA
    RRF Result, F
    GOTO Repeater

END
