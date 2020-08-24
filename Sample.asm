; Default header for generated assembly
        AREA ProgramData, DATA, READWRITE, NOINIT

SWI_WriteC      EQU &0 ; output the character in r0 to the screen
SWI_Write0      EQU &2 ; Write a null (0) terminated buffer to the screen
SWI_ReadC       EQU &4 ; input character into r0
SWI_Exit        EQU &11 ; finish program

; Rest of user's Data
GLOBAL_a        DCD 0
GLOBAL_b        DCD 0
GLOBAL_c        DCD 0
GLOBAL_d        DCD 0
GLOBAL_e        DCD 0
block_2_x       DCD 0

HEAP            SPACE 1000
        ALIGN
STACK_TOP       SPACE 1000
STACK_BASE
        ALIGN
STACK_PADDING   SPACE 100       ;Just in case
        ALIGN
;--------------------------------------------------------------------------------
; Program Code
;--------------------------------------------------------------------------------
        AREA RESET, CODE
        ENTRY
        LDR R13, =STACK_BASE-4 ; Set Stack Pointer to Stack_Base
        MOV R0, #1 ;Line 15
        MOV R1, #2 ;Line 16
        MOV R2, #3 ;Line 17
        MOV R3, #4 ;Line 18
        MOV R4, #5 ;Line 19
        MOV R4, #1 ;Line 20
FOR_0   LDR R12, =GLOBAL_e; Force storage of variable
        STR R4, [R12]
        BL func_incr
        ADD R5, R5, #1
        CMP R5, #5
        BLE FOR_0
        LDR R12, =GLOBAL_a; Force storage of variable
        STR R0, [R12]
        MOV R0, R4 ; force moving
        BL PRINTR0_ ;Print integer
        BL func_hello
        SWI SWI_Exit
;--------------------------------------------------------------------------------
; Function and Procedures
;--------------------------------------------------------------------------------
        AREA Functions, CODE
;"Library functions"

;--------------------------------------------------------------------------------
; Subroutine to print contents of register 0 in decimal
; By Dr. Tom Clarke
;--------------------------------------------------------------------------------
; ** REGISTER DESCRIPTION **
; R0 byte to print, carry count
; R1 number to print
; R2 ... ,thousands, hundreds, tens, units.
; R3 addresses of constants, automatically incremented
; R4 holds the address of units
; Allocate 10^9, 10^8, ... 1000, 100, 10, 1

CMP1_   DCD 1000000000
CMP2_   DCD 100000000
CMP3_   DCD 10000000
CMP4_   DCD 1000000
CMP5_   DCD 100000
CMP6_   DCD 10000
CMP7_   DCD 1000
CMP8_   DCD 100
CMP9_   DCD 10
CMP10_  DCD 1
; Entry point

PRINTR0_        STMED R13!,{r0-r4,r14}
                CMP R0, #0x0
                MOVEQ R0, #0x30
                SWIEQ SWI_WriteC
                BEQ PrintNewL
                MOV R1, R0
                ; Is R1 negative?
                CMP R1,#0
                BPL LDCONST_
                RSB R1, R1, #0 ;Get 0-R1, ie positive version of r1
                MOV R0, #'-'
                SWI SWI_WriteC

LDCONST_        ADR R3, CMP1_ ;Used for comparison at the end of printing

                ADD R4, R3, #40 ;Determine final address (10 word addresses +4 because of post-indexing)
                ; Take as many right-0's as you can...

NEXT0_          LDR R2, [R3], #4
                CMP R2, R1
                BHI NEXT0_
                ;Print all significant characters

NXTCHAR_        MOV R0, #0
SUBTRACT_       CMP R1, R2
                SUBPL R1, R1, R2
                ADDPL R0,R0, #1
                BPL SUBTRACT_

                ;Output number of Carries
                ADD R0, R0, #'0'
                SWI SWI_WriteC
                ; Get next constant, ie divide R2/10

                LDR R2, [R3], #4

                ;If we have gone past L10, exit function; else take next character
                CMP R3, R4;

                BLE NXTCHAR_;
                ; Print a line break
PrintNewL       MOV R0, #'\n'
                SWI SWI_WriteC
                LDMED R13!,{r0-r4,r15} ;Return

;-------------------------------------------------------------------
; User functions and procedures
;-------------------------------------------------------------------
; ------------------------------------------------------
; func_hello
; ------------------------------------------------------
func_hello      STMED R13!, {R14}; save to stack
        MOV R0, #65
        SWI SWI_WriteC
        LDMED R13!, {R15}; return
; ------------------------------------------------------
; func_incr
; R0 - x: integer
; R4 - Return Value : integer
; ------------------------------------------------------
func_incr       STMED R13!, {R14}; save to stack
        ADD R4, R0, #1 ;Line 11
        MOV R0, #5 ;Line 12
        LDMED R13!, {R15}; return

        END