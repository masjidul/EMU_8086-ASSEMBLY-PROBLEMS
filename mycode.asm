.MODEL SMALL
.STACK 100H
.DATA 
;THE VARIABLE WILL BE DECLARE HERE   
NUM1 DB ?


.CODE

    MAIN PROC    ;CODE STATEMENTS
        
    MOV BH, 4
    MOV BL, 5
    
    ADD NUM1, BH  ; NUM1 = NUM1 + BH
    
    MOV AH, 4CH
    INT 21H
        
        
    MAIN ENDP
    END MAIN