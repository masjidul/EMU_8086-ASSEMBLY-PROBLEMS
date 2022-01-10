                  
INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
                                    
    arr DB 11 DUP (?)
        
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
 
        PRINTN
        PRINT "Enter array element : "  
        
        XOR CX,CX
        MOV CL,11
        MOV SI,0
        
        LOOP_INPUT:
            MOV AH,1
            INT 21H
            MOV arr[SI],AL
            SUB AL,48
            INC SI
            
        LOOP LOOP_INPUT 
        
        MOV CL,11
        DEC CX 
        
        CALL Ascending
 
    
        MOV AH,4CH
        INT 21H
    MAIN ENDP
    
Ascending proc
 
 OuterLoop:
 mov bx, cx
 mov si, 0
  
 CompLoop:
 mov al,arr[si]
 mov dl,arr[si+1]
 cmp al,dl
 jc noSwap
 mov arr[si], dl
 mov arr[si+1], al
 
 noSwap: 
 inc si
 dec bx
 jnz CompLoop
 loop OuterLoop
 
 mov ah,2
 mov dl,0AH
 int 21h
 
 mov dl, 0DH
 int 21h
 print "After Sorting in Ascending Order: "
 mov cx,11
 mov bx, offset arr 
 
 Outputs:
 mov dl,[bx]
 mov ah, 2
 int 21h
 
 mov dl,32
 mov ah, 2
 int 21h
 inc bx
 loop Outputs 
 
 RETURN:
 RET
 
 
 Ascending endp

end main