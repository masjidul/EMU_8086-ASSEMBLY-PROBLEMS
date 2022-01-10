AZAD MACRO A1
    MOV AL, A1
    MOV AH, 2
    MOV DL, AL
    ADD DL, 48
    INT 21H
ENDM

.MODEL SMALL
.STACK 100H
.DATA

    N DB ?
    ODD DB ?
    EVEN DB ?
    M DB ?
    Z DB ?
    
   A  DB N DUP (?)
   
   A1 DB "ENTER THE INPUT NUMBER: $"
   A2 DB 0AH, 0DH, "ENTER ELEMENTS: $"
   A5 DB 0AH, 0DH, "$"
   A3 DB 0AH, 0DH, "ALL EVEN NUMBER: $"
   A4 DB 0AH, 0DH, "ALL ODD NUMBER:  $"
   
   
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV ODD, 0
        MOV EVEN, 0
        MOV BX, 0
        
        LEA DX, A1
        MOV AH, 9
        INT 21H
        
        MOV AH, 1
        INT 21H
        SUB AL, 30H
        MOV N, AL
        
        LEA DX, A5
        MOV AH, 9
        INT 21H
        
        LEA DX, A2
        MOV AH, 9
        INT 21H
        
        XOR CX, CX
        MOV CL, N
        MOV SI, 0
        
        LOOP_1:
            MOV AH, 1
            INT 21H
            SUB AL, 30H
            
            MOV A[SI], AL
            INC SI
            
        LOOP LOOP_1       
        
        LEA DX, A5
        MOV AH, 9
        INT 21H
        
        
        LEA DX, A3
        MOV AH, 9
        INT 21H
        
        XOR CX, CX
        MOV CL, N
        MOV Z , 2
        MOV SI, 0
        
        LOOP_2:
            CALL F1
        LOOP LOOP_2
        
        LEA DX, A5
        MOV AH, 9
        INT 21H
        
        LEA DX, A4
        MOV AH, 9
        INT 21H
        
        XOR CX, CX
        MOV CL, N
        MOV Z, 2
        MOV SI, 0
        
        LOOP_3:
            CALL F2
        LOOP LOOP_3
        
        MOV AH, 4CH
        INT 21H
    ENDP MAIN
    
    F2 PROC
        MOV AX, 00
        MOV AL, A[SI]
        DIV Z
        MOV DI, SI
        INC SI
        
        CMP AH, 00
        JZ RES_3
        JNZ RES_4
        
        RES_3:
        JMP END1
        
        RES_4:
        AZAD A[DI]
        JMP END1
        
        END1:
        RET
    F2 ENDP
    
    F1 PROC
        MOV AX, 00
        MOV AL, A[SI]
        DIV Z
        MOV DI, SI
        INC SI
        
        CMP AH, 00
        JZ RES_1
        
        JNZ RES_2
        
        RES_1:
        AZAD A[DI]
        JMP END2
        
        RES_2:
        JMP END2
        
        END2:
        RET
        
    F1 ENDP