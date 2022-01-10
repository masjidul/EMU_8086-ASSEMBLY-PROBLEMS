INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA

    STORE_AX DW ?
    STORE_DX DW ?

.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX


    MOV AX, 7FH
    MOV BX, 80;
    MUL BX ;IMUL FOR SIGNED, DX : AX= AX = BX FOR 16BIT
    
    MOV AL, 1
    MOV DL, 2
    MUL DL;     AH : AL = AL = DL
    
    MOV STORE_DX, DX
    MOV STORE_AX, AX
    
    CALL PRINT_PRODUCT
    
    
    MOV AH, 4CH 
    INT 21H
    MAIN ENDP

PRINT_PRODUCT PROC
    MOV BX, STORE_DX
    CALL PRINT_HEX
    
    MOV BX, STORE_AX
    CALL PRINT_HEX
    RET
    
PRINT_PRODUCT ENDP


PRINT_HEX PROC
    MOV CX, 4
    MOV AH, 2
    
    FOR:
       MOV DL, BH
       SHR DL, 4
       SHL BX, 4
       
       CMP DL, 10
       JGE LETTER
       
       ADD DL, 48
       INT 21H
       JMP END_FOR
       
       LETTER:
       ADD DL, 55
       INT 21H
       
       END_FOR:
       LOOP FOR
       
       RET
       PRINT_HEX ENDP 
   
       
             
END MAIN