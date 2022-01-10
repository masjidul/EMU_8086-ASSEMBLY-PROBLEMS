INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
  NUM DB ?
.CODE
MAIN PROC
     MOV AX , @DATA
     MOV DS, AX
     
     MOV AH, 1
     INT 21H
     SUB AL, 48
     MOV NUM, AL
     
     MOV BH, 1 ; INT I=1
     PRINTN
     MOV AH, 2
     MOV DL, '*'
     
     LOOP1:
        CMP BH, NUM
        JG END_LOOP1
        MOV BL, 1 ; INT J = 1
        LOOP2:
            CMP BL, BH
            JG END_LOOP2
            INT 21H ; FOR PRINT
            INC BL
            JMP LOOP2
        
        END_LOOP2:
        PRINTN
        INC BH
        JMP LOOP1
        
      END_LOOP1:
      MOV AH, 4CH
      INT 21H
      MAIN ENDP
END MAIN