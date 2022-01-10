            ; find smallest number
            ; find largest number
            ; find average
.MODEL SMALL
.STACK 100H
.DATA 
    N1 DB ? 
    SM DB ?
    LR DB 0
    AV DW ?
    
    
    M1 DB "Enter array size : $"
    M2 DB 0DH,0AH,"Enter array element : $"
    M3 DB 0DH,0AH,"The smallest value is : $"
    M4 DB 0DH,0AH,"The largest value is : $" 
    M5 DB 0DH,0AH,"The average value is : $"                                    
                                          
    
    ARR1 DB N1 DUP (?)
    
    
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        MOV DX, OFFSET M1
        MOV AH,09H
        INT 21H
        
        MOV AH,1
        INT 21H
        MOV N1,AL
        SUB N1,48
        
        MOV AH,09H
        LEA DX,M2
        INT 21H
        
        XOR CX,CX
        MOV CL,N1
        MOV SI,0
        
        LOOP_INPUT:
            MOV AH,1
            INT 21H
            MOV ARR1[SI],AL
            SUB AL,48
            INC SI
            
        LOOP LOOP_INPUT 
        
        CALL SMALL_P 
        
        CALL AVERAGE_P
        
        
      

        MOV AH,4CH
        INT 21H
    MAIN ENDP
    
    
    SMALL_P PROC  ;----////////
        
        XOR DX,DX
        XOR CX,CX
        XOR BX,BX
        
        MOV SI,0
        MOV CL,N1
        DEC CL
        MOV BL,ARR1[SI]
        SUB BL,30H 
        MOV SM,BL
        MOV SI,1
        
        L_SMALL:
            
            SUB ARR1[SI],48
            CMP BL,ARR1[SI]
            JL SKIP
            JG SMALL
            
            SMALL:
                MOV BL,ARR1[SI]
                MOV SM,BL
            SKIP:
            INC SI
            
        LOOP L_SMALL
        
        
        MOV AH,09H
        LEA DX,M3
        INT 21H
        
        MOV DL,SM
        ADD DL,48
        MOV AH,02 
        INT 21H
       
          
    SMALL_P ENDP  ;----////////  
    
    
    
    LARGEST_P PROC ;********** 
        
        XOR DX,DX
        XOR CX,CX
        XOR BX,BX
        
        MOV SI,0
        MOV CL,N1
        DEC CL
        MOV BL,ARR1[SI] 
        SUB BL,30H
        MOV LR,BL
        MOV SI,1
        
        L_LARGE:
            
            CMP BL,ARR1[SI]
            JL LARGE
            JG U_J
            
            LARGE:
                MOV BL,ARR1[SI]
                MOV LR,BL
            U_J:
            INC SI
            
        LOOP L_LARGE
        
        
        MOV AH,09H
        LEA DX,M4
        INT 21H
        
        MOV DL,LR
        ADD DL,30H
        MOV AH,02 
        INT 21H
        
    LARGEST_P ENDP ;********** 
    
    AVERAGE_P PROC ;----------////////// 
        
        XOR AX,AX
        XOR BX,BX
        XOR CX,CX
        XOR DX,DX 
        MOV SI,0
        MOV CL,N1
        DEC CL
        
        MOV AL,ARR1[SI]
        SUB AL,30H
        INC SI
        
        SUM:
            MOV BL,ARR1[SI]
            
            ADD AL,BL
            INC SI
            
        LOOP SUM
        
        MOV AV,AX 
        
        MOV AH,09H
        LEA DX,M5
        INT 21H 
        
        MOV AX,AV
        XOR BX,BX
        MOV BL,N1
        DIV BL

        
        MOV DL,AL
        ADD DL,48
        MOV AH,2
        INT 21H    
        
        
        
        
    AVERAGE_P ENDP ;----------//////////
    
    
    
END MAIN