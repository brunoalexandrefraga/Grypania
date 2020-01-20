    #INCLUDE <p16f84.inc>
    
    CBLOCK 0x0C
    CONTR
    CONT1
    REGB
    ENDC
    
    ORG 0x00
    
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
    BTFSC PORTA, 4
    GOTO $-1
    MOVF PORTB, W
    MOVWF REGB
    


include <picf84.inc>
cblock
contador1
n1
contadorbit
resposta
endc

inicio
bsf status, rpo;
movlw b'11111111';
movlw trisb;
movlw b'100000'
movwf trisa;

main
clrf porta;
btfss port, 4;
goto main;
bcf status, c;

movendo
movf portb, w;
movwf n1;
movlw b'00001000';
movwf contador1;

contagem
rlf n1, f;
btfsc status, c;
incf contadorbit;
goto contagem;
bcf status, c;

testes
movf contadorbit, w;
sublw .4;
btfsc status, z;
goto igual;
btfss status, c;
goto negativo
goto positivo;

igual
movlw .4;
movwf porta;
goto main;

negativo
movf contadorbit, w;
movwf porta;
movlw .2;
movwf porta;
goto main;

positivo
movf contadorbit, w;
sublw .8;
movwf porta;
movlw .1;
movwf porta;
goto main;

end
