;Write an assembly language program to compute 4x2 +3x... ... if x is stored in r1. Store the result in r0

				AREA    equation, CODE, READONLY
ENTRY
start
		MUL r0, r1, r1                     ; result <-- x * x
        LDR r2, =4                         ; tmp <-- 4
        MUL r0, r2, r0                     ; result <-- 4 * x * x
        LDR r2, =3                         ; tmp <-- 3
        MUL r2, r1, r2                     ; tmp <-- x * tmp
        ADD r0, r0, r2                     ; result <-- result + tmp
stop          B     stop
               END   