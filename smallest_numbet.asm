; to find the smallest number in an array

  AREA  SMALLEST_NUMBER, CODE, READONLY
ENTRY
	MOV R5, #06				; load the counter number ; here 7 numbers
	MOV R1,#0x40000000		; starting address of the 1st number
	MOV R2,#0x4000001C		; address for storing result
	LDR R3,[R1]				; load the first number
LOOP ADD R1,R1,#04			; increment the offset by 4
	 LDR R4,[R1]			; load second number
	 CMP R3, R4				; compare
	 BLS LOOP1				; branch
	 MOV R3, R4			
LOOP1 SUBS R5,R5,#01		; decrement the count by 1
	 CMP R5,#00
	 BNE LOOP
	 STR R3,[R2]			; store the result
	 SWI 0x11
	 END