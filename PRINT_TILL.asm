 INCLUDE 'EMU8086.INC'
 .MODEL SMALL
 .STACK 100H
 
 .DATA
    PROMPT  DB  'ENTER A NUMBER: $'  
    INPUT DB ?
    
 
 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS 
     MOV DS, AX
 
     LEA DX, PROMPT               ; load and print PROMPT 
     MOV AH, 9
     INT 21H
     
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV INPUT,AL
    MOV AH,0
     
     XOR BH, BH
     MOV BH, INPUT                 ; initialize CX
     
     PRINTN
     MOV AH, 2                    ; set output function  
     MOV DL, 48                   ; set DL with 0
 
     @LOOP:                       ; loop label
       INT 21H                    ; print character
 
       INC DL
       PRINTN                     ; increment DL to next ASCII character
       DEC BH                     ; decrement CX
     JNZ @LOOP                    ; jump to label @LOOP if CX is 0
     
                   
     MOV AH, 2
     MOV AL, DL
     INT 21H
     
     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN