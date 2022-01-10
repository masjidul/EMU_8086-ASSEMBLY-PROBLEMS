INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
 
 NUM DB 0, 1 , 2, 3, 4, 5,6 ,7 ,8, 9
 ;NUM1 DB 10 DUB (?)
 ;NUM3 DB 10 DUB (0)
 NUM2 DW 65, 66, 67, 68, 69
 ;TST DB 5, 4, 3 DUP(2), 3 DUP(2, 3 DUP(8) )
 ; 5 4 2 2 2 2 8 8 8 2 8 8 8 2 8 8 8
.CODE

MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    LEA SI, NUM2
    
    MOV CX, 10
    MOV AH, 2
    FOR:
    MOV DL , [SI]
    ;ADD DL, 48
    INT 21H
    ADD SI, 2
    
    LOOP FOR
    
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN