;Write ARM assembly language program to display "Hello World"

        AREA      HelloW, CODE, READONLY
SWI_WriteC        EQU  &0   
SWI_Exit         EQU  &11   
        ENTRY   
 
START     ADR        R1, TEXT   
LOOP     LDRB    R0, [R1], #1
       
        CMP      R0, #0
        SWINE    SWI_WriteC   
        BNE        LOOP
        SWI        SWI_Exit    
       
TEXT    =        "HELLO WORLD", &0a, &0d, 0
        END