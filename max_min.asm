;Write ARM assembly language program to find largest/smallest value from given two numbers.
    
        AREA    bigger, CODE, READONLY
ENTRY
MAIN
        LDR    R1, Value1        ;load first value to be compared
        LDR    R2, Value2        ;load second value to be compared
        CMP    R1, R2             ;compare them
        BHI    DONE               ;if R1 contains the highest
       
        MOV R1, R2                ;otherwise overwrite R1
       
DONE
        STR    R1, Result            ;store the result
        SWI    &11
       
Value1    DCD    &12345678        ;value to be compared
Value2    DCD    &87654321        ;value to be compared
Result    DCD    0                          ;space to store result
        END