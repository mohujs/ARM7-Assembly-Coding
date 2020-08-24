 area ascen,code,readonly
 entry
 code32
 adr r0,thumb+1
 bx r0
 code16
thumb
 mov r0,#00        ;  first two fibonacci numbers
 sub r0,r0,#01     ; assigning -1 to first register
 mov r1,#01
 mov r4,#10        ;No of fibonacci numbers to generate
 ldr r2,=0x40000000;address to store fibonacci numbers
back add r0,r1     ;adding the previous two numbers
 str r0,[r2]       ; storing the number in a memory
 add r2,#04        ;incrementing the address
 mov r3,r0
 mov r0,r1
 mov r1,r3
 sub r4,#01        ;decrementing the counter
 cmp r4,#00        ;comparing the counter to zero
 bne back          ;looping back
 end