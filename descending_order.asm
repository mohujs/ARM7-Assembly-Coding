; Descending order for numbers

 AREA DESCEND, CODE, READONLY
ENTRY
START MOV R0, #05 ; count of six numbers
LOOP3 MOV R1,#05    ; R1 is second counter
	  MOV R2, #0x40000000 ; data and result
LOOP2 LDR R3,[R2]
	  ADD R2, R2, #04
	  LDR R5, [R2]
	  CMP R3, R5   ; compare R3 & R5 registers
	  BGT LOOP1	 	; correct order OK else go to loop1
	  STR R3, [R2]  ; else exchange
	  SUB R2, R2, #04  ; point to first location
	  STR R5, [R2]
	  ADD R2, R2, #04	; point to next location

LOOP1 SUB R1, R1, #01	; decrement the counter R1
	  CMP R1, #00		; COMPARE WITH ZERO 
	  BNE LOOP2			; if not go the loop2
	  SUB R0,R0, #01	; DECEMENT THE COUNTER
	  CMP R0, #00		; AGAIN COMPARE WITH ZERO
	  BNE LOOP2			; IF NOT EQUAL to zero go to loop3
	  SWI &11			; TERMINATE THE PROGRAM
	  END				; END OF THE PROGRAM