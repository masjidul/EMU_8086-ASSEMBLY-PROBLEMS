.MODEL SMALL
.STACK 100H
.DATA

NUM DB 'd'
MSG DB "MY NAME IS ROBIN $"

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 2 ; FOR PRINT , ONCE DECLARE IS OKAY
    MOV DL, NUM
    INT 21H
    
     ;NEWLINE SEGMENT
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    MOV AH, 9
    LEA DX , MSG
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
END MAIN