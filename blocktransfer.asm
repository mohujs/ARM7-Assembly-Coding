    AREA program,CODE,READONLY
      ENTRY
      LDR R0,=0x40000000   ; Source memory base address 
      LDR R1,=0x50001000   ; Destination memory base address
      MOV R2,#0x0A         ; Counter register with value equal to number of elements in source memory
label LDR R3,[R0],#4       ; Loading value to temporary register
      STR R3,[R0],#4       ; Storing the value at destination memory
      SUB R2,R2,#1
      CMP R2.#00
      BNE loop
      END