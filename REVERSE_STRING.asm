INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA 
.CODE

MAIN PROC
    PRINT "ENTER NUMBER: "
    MOV AH, 1
    XOR CX, CX
    
    FOR1:
        INT 21H
        CMP AL, 0DH
        JE END_FOR1
        
        PUSH AX
        INC CX
        JMP FOR1
    END_FOR1:
    
    PRINTN 
    PRINT "OUTPUT: "
    
    MOV AH, 2
    OUTPUT:
        POP DX
        INT 21H
    LOOP OUTPUT
    
    MOV AH, 4CH
    MAIN ENDP
END MAIN