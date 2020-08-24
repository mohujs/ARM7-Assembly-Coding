;//* To find the multiplication of two 32 bit number *//
 AREA  bit_multiplication, CODE, READONLY
ENTRY
MAIN
	MOV R0, #0x40000000
	LDRH R2,[R0]
	MOV R1, #0x40000006
	LDRB R3, [R1]
	MUL R5, R2, R3
	MOV R4, #0x4000001C
	STR R5, [R4]
 
stop B stop
	END