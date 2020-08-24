;example of 32-bit addition       
	   AREA    add32, CODE, READONLY
SWI_WriteC      EQU &0 ; output the character in r0 to the screen
SWI_Write0      EQU &2 ; Write a null (0) terminated buffer to the screen
SWI_ReadC       EQU &4 ; input character into r0
SWI_Exit        EQU &11 ; finish program
	
ENTRY
MAIN
        LDR    R0, =Value1
        LDR    R1, [R0]
           
        ADD    R0, R0, #0*4
           
        LDR    R2, [R0]
           
        ADD R1, R1, R2
           
        LDR    R0, =Result
           
 
        SWI SWI_WriteC   
        SWI    &11
           
Value1    DCD    &37E3C123
Value2    DCD    &367402AA
           
Result    DCD    0
		END