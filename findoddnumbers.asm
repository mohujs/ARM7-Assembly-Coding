 AREA program,CODE,READONLY
      ENTRY
      MOV R0,#01          ; Storing 0x01 for AND operation
      LDR R1,=array       ; Storing base address of array
      MOV R2,#0X09        ; Initializing counter
lbl   AND R0,[R1],#4      ; 'AND'ing to check whether number is odd or even
      ADDNE R3,R3,#O1     ; R3 register will have count of number of odd numbers.
      SUBS R2,R2,#01
      BPL lbl
array DCD  0x11223343, 0x12345672, 0x002917BD3, 0x00000A01, 0x62398746, 0xAB56E3CE, 0x0A761AC7, 0x623ABC46, 0xAB86E3BD, 0x0A762DE8,
      END