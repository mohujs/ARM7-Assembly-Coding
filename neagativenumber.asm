AREA program,CODE,READONLY
      ENTRY
      LDR R1,=array       ; Storing base address of array
      MOV R2,#0X09        ; Initializing counter
lbl   AND R0,[R1],#4
      CMP R0,#00          ; Comparing with zero
      ADDMI R3,R3,#01     ; R3 register will have count of number of negative numbers.
      SUBS R2,R2,#01
      BPL lbl
array DCD  0x11223343, -0x12345672, 0x002917BD3, -0x00000A01, -0x62398746, 0xAB56E3CE, -0x0A761AC7, 0x623ABC46, -0xAB86E3BD, 0x0A762DE8,
      END