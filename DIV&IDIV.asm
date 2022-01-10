
.MODEL SMALL
.STACK 100H
.DATA

    I DW ?
    ID DW ?

.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    ;PRINT 'ENTER A NUMBER: '
    
    MOV AH, 1
    INT 21H
    SUB AL, 48
    MOV I, AL
    
    MOV AH, 1
    INT 21H
    SUB AL, 48
    MOV ID, AL
    
    MOV AX, INPUT
    DIV AL
    
    MOV AH, 2
    MOV DL, AX
    MOV DL, 48
    INT 21H
    
    
    
    
    
    MOV AH, 4CH 
    INT 21H
    MAIN ENDP


             
END MAIN