INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA

.CODE

MAIN PROC
    
    CALL MULTIPLICATION
    MOV AH, 4CH 
    INT 21H
    MAIN ENDP
    
    MULTIPLICATION PROC
        PRINT 'ENTER A NUMBER: '
        MOV AH, 1
        INT 21H
        MOV BL, AL
        SUB BL, 48
        
        PRINTN
        PRINT 'ENTER ANOTHER NUMBER: '
        INT 21H
        MOV CL, AL
        SUB CL, 48
        
        PRINTN
        MOV DL, 0 ;TO STORE RESULTS
        
        FOR:
            CMP CL, 0
            JE END_FOR
            SHR CL, 1
            
            JNC CHECK
            ADD DL, BL
           
            CHECK: 
             SHL BL, 1
             JMP FOR
             
         END_FOR:
         PRINT 'OUTPUT: '
         MOV AH, 2
         INT 21H
         
         RET
      MULTIPLICATION ENDP
         
             
END MAIN