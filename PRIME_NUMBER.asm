INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 10H
.CODE

MAIN PROC   
	   
	  
	   
	  MOV BH,0
	  MOV BL,10D
	   
	   PRINT "ENTER A NUMBER: "
	   
	   INPUT:
	   MOV AH,1
	   INT 21H
	   PRINTN
	   CMP AL,13D
	   JNE NUMBER 
	   
	   JMP CHECK
	   
	   
	   NUMBER:
	   SUB AL,30H
	   MOV CL,AL
	   MOV AL,BH
	   MUL BL
	   ADD AL,CL
	   MOV BH,AL
	   
	   JMP INPUT   
	   
	   CHECK:   
	   
	   CMP BH,1
	   JLE NOT_PRIME
	   
	   MOV CX,2
	   AND AX,0
	   AND DX,0
	   
	   MOV AL,BH
	   DIV CX
	   
	   MOV CX,AX           
	   
	   ISPRIME:
	   CMP CX,2
	   JL PRIME
	   AND AX,0
	   AND DX,0
	   MOV AL,BH             
	   DIV CX 
	   DEC CX
	   CMP DX,0
	   JE NOT_PRIME
	   JMP ISPRIME
	   
	   
	   
	   
	   PRIME:
	   MOV AH,2 
	   MOV DL,0AH
	   INT 21H
	   
	   MOV DL,0DH
	   PRINT "PRIME"
	   JMP EXIT
	   
	   
	   NOT_PRIME:
	   MOV AH,2 
	   MOV DL,0AH
	   INT 21H
	   MOV DL,0DH
	   PRINT "NOT PRIME"
	  EXIT:	   
	  	   
	  	   
			   
	MAIN ENDP
END MAIN