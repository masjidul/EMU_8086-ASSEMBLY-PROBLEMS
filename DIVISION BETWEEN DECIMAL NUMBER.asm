INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 200H
.DATA
    MSG DB "INPUT: $"
    N DB ?
    ID DB 8 
.CODE 
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        LEA DX,MSG
        MOV AH,09
        INT 21H
        
        MOV AH,1
        INT 21H
        SUB AL,30H
        MOV N,AL
        
        XOR AX,AX
        MOV AL,N
        MOV BL,ID
        DIV BL 
        
        XOR BX,BX
        MOV BH,AL
        MOV BL,AH
        
        PRINTN
        PRINT "RESULT: "
        
        MOV DL,BH
        ADD Dl,30H
        MOV AH,2
        INT 21H
        
        MOV DL,46
        MOV AH,2
        INT 21H
        
        MOV DL,BL
        ADD DL,30H
        MOV AH,2
        INT 21H  
        
    MAIN ENDP
END MAIN