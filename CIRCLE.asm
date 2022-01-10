;AREA OF A CIRCLE, A=3.1416 * R*R
DATA SEGMENT
    A DW ?
    PI DB 3.1416
    R DB 20
ENDS
CODE SEGMENT
    ASSUME DS:DATA CS:CODE
    START:
        MOV AX, DATA
        MOV DS, AX
        
        MOV AH, 0
        MOV AL, PI
        MUL R
        MUL R
        MOV A, AX
        
        MOV AH, 2
        INT 21H
        
        MOV AH, 4CH
        INT 21H
        
ENDS
END START
        