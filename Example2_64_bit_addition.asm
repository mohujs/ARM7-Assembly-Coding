AREA    add64, CODE, READONLY
ENTRY
MAIN
        LDR    R0, =Value1        ;pointer to first value
        LDR    R1, [R0]            ;load first part of value1
        LDR    R2, [R0, #4]        ; load lower part of value1
        LDR    R0, =Value2        ;pointer to second  value
        LDR    R3, [R0]            ;load upper part of value2
        LDR    R4, [R0, #4]        ; load lower part of value2
      
        ADDS    R6, R2, R4        ;add lower 4 bytes  and set carry flag
        ADC    R5, R1, R3        ;add upper 4 bytes  including carry
      
        LDR    R0, =Result        ;pointer to result
      
        STR    R5, [R0]            ;store upper part of result
        STR    R6, [R0, #4]        ;store lower part of result
      
        SWI    &11
      
Value1    DCD    &12A2E640, &F2100123
Value2    DCD    &001019BF, &40023F51
Result    DCD    0
      
        END