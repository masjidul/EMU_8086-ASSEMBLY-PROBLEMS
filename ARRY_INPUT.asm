INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
 
 NUM DB 10 DUB (?)
 
.CODE

MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    XOR BX, BX
    MOV CX, 10
    PRINTN
    MOV AH, 1
    FOR:    
        MOV NUM[BX], AL
        INT 21H
        INC BX
    LOOP FOR
    XOR BX, BX
    MOV AH, 2
    FOR2:
        MOV DL, NUM[BX]
        INT 21H
        INC BX
    LOOP FOR2
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN