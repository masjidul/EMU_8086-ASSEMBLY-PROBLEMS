INCLUDE 'EMU8086.INC'
DATA SEGMENT
B    DB ?
H    DB ?
RES  DB 10 DUP ('$')
MSG1 DB "ENTER BASE : $"
MSG3 DB "ENTER HEIGHT : $"
MSG2 DB 10,13,"AREA : $"

DATA ENDS

CODE SEGMENT
ASSUME DS:DATA,CS:CODE

START:
    MOV AX,DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV B,AL
    MOV AH,0
    
    PRINTN
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV H,AL
    MOV AH,0
    
    MOV AL, B
    MOV DL, H
    MUL DL;
    
    MOV DL,1
    MUL DL
    MOV DX,0
    MOV BX,2
    DIV BX
    LEA SI,RES
    CALL HEX2DEC
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    LEA DX,RES
    MOV AH,9
    INT 21H
    
MOV AH,4CH
INT 21H
CODE ENDS

    HEX2DEC PROC NEAR
        
    MOV CX,0
    MOV BX,10
    
   LOOP1: MOV DX,0
    DIV BX
    ADD DL,30H
    PUSH DX
    INC CX
    CMP AX,9
    JG LOOP1
    ADD AL,30H
    MOV [SI],AL
    
   LOOP2: POP AX
    INC SI
    MOV [SI],AL
    LOOP LOOP2
   RET
HEX2DEC ENDP
END START
