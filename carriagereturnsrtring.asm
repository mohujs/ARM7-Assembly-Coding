;Basically The Carriage Return (CR) character (0x0D, r) moves the cursor to the beginning of the line without advancing to the next line. This character is used as a new line character in Commodore and Early Macintosh operating systems (OS-9 and earlier). 

area string,code
entry
LDR R0,=data
MOV R1,#00
loop LDRB R2,[R0],#1
     CMP R2,0x0D
     BEQ stop
     ADD R1,#1
     B loop
stop b stop
data dcb "codesexplorerr"
end