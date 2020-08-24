 AREA program,CODE,READONLY
      ENTRY
      MOV R0,#01          ; Storing 0x01 for AND operation
      LDR R1,=array       ; Storing base address of array
      MOV R2,#0X09        ; Initializing counter
lbl   AND R0,[R1],#4      ; 'AND'ing to check whether number is odd or even
      ADDEQ R3,R3,#O1     ; R3 register will have count of number of even numbers.
      SUBS R2,R2,#01
      BPL lbl
array DCD  0x11223344, 0x12345671, 0x002917343, 0x00000001, 0x62398746, 0xAB56E3CD, 0x0A761BC7, 0x623ABC46, 0xAB86E3BD, 0x0A761DE8,  
      END