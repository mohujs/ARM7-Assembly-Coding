;Write ARM assembly language program to find the one's complement (inverse) of a number.

        AREA    Program, CODE, READONLY
        ENTRY

Main
        LDR     R1, Value                        ; Load the number to be complemented
        MVN     R1, R1                          ; take 1's complement of R1
        STR     R1, Result                        ; Store the result
        SWI     &11

Value   DCD     &FF                            ; Value to be complemented
Result  DCD     &ABCD1234              ; Storage for result

        END