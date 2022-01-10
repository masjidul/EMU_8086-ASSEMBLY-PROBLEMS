INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
COUNT DB 0
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV BX , 0
    
    PRINTN "INPUT: "
    MOV AH, 1
    FOR1:
        INT 21H
        CMP AL, 0DH
        JE END_FOR
        SUB AL, 48
        SHL BX, 1
        INC COUNT
        OR BL, AL        
        JMP FOR1
        
        END_FOR:
    PRINTN
    PRINTN "OUTPUT: "
    
    MOV CL, 16
    SUB CL, COUNT
    RCL BX, CL
    
    XOR CH, CH
    MOV CL, COUNT
    
    MOV AH, 2
    FOR2:
        RCL BX, 1
        JC OUTPUT_ONE
        MOV DL, '0'
        INT 21H
        JMP LAST_LOOP
        
        OUTPUT_ONE:
        MOV DL, '1'
        INT 21H
        
        LAST_LOOP:
        LOOP FOR2
    
    MOV AH, 4CH
    INT 21H
    
   MAIN ENDP
END MAIN