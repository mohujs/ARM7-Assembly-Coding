;Write ARM assembly language program to find average of two numbers.

             AREA    Average, CODE, READONLY                    ; name code block
             ENTRY                                             ; marker of first executable instruction
start             
             ADR    r1, FIRSTNUM                                ; load first address into r1
             ADR    r2, SECONDNUM                                ; load second address into r2
             ADR    r3, AVGRESULT                                ; load result address into r3
             LDR    r4, [r1]                                    ; load first number into r4
             LDR    r5, [r2]                                    ; load second number into r5
             ADD    r0, r4, r5                                    ; add numbers together
             MOV    r0, r0, ASR#1                                ; divide by two using arithmetic shift
             STR    r0, [r3]                                    ; store result to address pointed to by r3
                      
             SWI    0x11                                        ; terminate the program
            
FIRSTNUM    DCD    &20
SECONDNUM    DCD    &50
AVGRESULT    DCD    &0           
            END                                                 ; marks the end of the file