DATA SEGMENT
    T    DB ?
    RES  DB 10 DUP ('$')
    MSG1 DB "ENTER TEMPERATURE IN FAHRENHEIT(ONLY IN 2 DIGITS) : $"
    MSG2 DB 10,13,"CONVERTED IN CELSIUS (TEMPERATURE) : $"
DATA ENDS

CODE SEGMENT
ASSUME DS:DATA,CS:CODE
START:

    MOV AX,DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    SUB AL,30H
    MOV AH,0
    MOV BL,10
    MUL BL
    MOV BL,AL                    ;C = (5/9) * (F-32) 
    
    MOV AH,1
    INT 21H
    
    SUB AL,30H
    MOV AH,0
    ADD AL,BL
    SUB AL,32
    MOV T,AL
    
    MOV DL,5
    MUL DL
    MOV BL,9
    DIV BL
    MOV AH,0
    
    
    LEA SI,RES
    
    CALL HEX2DEC
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    LEA DX,RES
    MOV AH,9
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    CODE ENDS
    HEX2DEC PROC N EAR
        MOV CX,0
        MOV BX,10
        LOOP1: MOV DX,0
            DIV BX
            ADD DL,30H
            PUSH DX
            INC CX
            CMP AX,9
            JG LOOP1
            ADD AL,30H
            MOV [SI],AL
        LOOP2: 
            POP AX
            INC SI
            MOV [SI],AL
            LOOP LOOP2
            RET
    HEX2DEC ENDP
END START