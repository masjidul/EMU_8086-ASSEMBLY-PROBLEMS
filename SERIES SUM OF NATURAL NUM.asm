INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
 NUM DB ?
 SUM DB 0
 
 .CODE
 MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    PRINT "ENTER A NUMBER: "
    MOV AH, 1
    INT 21H
    SUB AL, 48 ;BECAUSE ITS ASCII
    MOV NUM, AL
    
    PRINTN
    
    MOV BL, 1 ; INT =0
    
    TOP:
    CMP BL, NUM
    JG EXIT_LOOP
    ADD SUM, BL
    INC BL
    JMP TOP
    
    EXIT_LOOP:
    PRINT "SUM IS: "
    
    MOV AH, 2
    MOV DL, SUM
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
 END MAIN