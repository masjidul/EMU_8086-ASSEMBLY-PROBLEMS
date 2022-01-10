INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA

    NUM DB 0
    COUNT DB 0

.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    XOR CX, CX ;COUNTER
    XOR DX, DX ;TO STORE THE OUTPUT
    
    CALL DEC_INPUT
    
    PRINTN
    
    MOV AH, 2
    INT 21H  
    
    PRINTN
    MOV NUM, DL
    
    CALL DEC_OUTPUT
    
    MOV AH, 4CH 
    INT 21H
    MAIN ENDP

DEC_INPUT PROC
    PRINT 'INPUT: '
    
    FOR:
        MOV AH, 1
        INT 21H
        CMP AL, 0DH
        JE END_FOR
        SUB AL, 48
        MOV NUM, AL
        MOV AL, 10
        MUL DL  
        ADD AL, NUM
        MOV DL, AL
        INC COUNT
        JMP FOR
        END_FOR:
        
    
    RET
    
DEC_INPUT ENDP

DEC_OUTPUT PROC
    PRINT 'OUTPUT: '
    
    XOR CX, CX
    MOV CL, COUNT
    
    MOV BL, 10
    XOR AH, AH
    MOV AL, NUM
    
    FOR2:
    DIV BL
    XOR DX, DX
    MOV DL, AH
    ADD DL, 48
    PUSH DX
    
    LOOP FOR2
    
    XOR CX, CX
    MOV CL, COUNT 
    
    MOV AH, 2
    
    FOR3:
        POP DX
        INT 21H
    LOOP FOR3
        
        RET 
    
    
    
DEC_OUTPUT ENDP
  
END MAIN