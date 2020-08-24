;//* To find the multiplication of two 32 bit number *// 
	AREA ADDTIN,CODE, READONLY
	ENTRY
start
	ldr r0,value1
	ldr r1,value2
	umull r4,r3,r1,r0
stop B stop
value1 dcd &BBBBBBBB
value2 dcd &CCCCCCCC
	END