.include "address_map_arm.s"
.text
.globl _start
_start:
    LDR R0, =SW_BASE // R0 = 0xFF200040
    LDR R1, =LEDR_BASE // R1 = 0xFF200000
    MOV R4,#0x1100
L1: LDR R2, [R0] // R2 = value on SW0 through SW9 on DE1-SoC
    MOV R3, R2, LSL #1 // R3 = R2 << 1 (which is 2*R2)
    LDR R1, =L1
    ADD R14, R1, #1
    MOV PC,LR 
    STR R3, [R1] // display contents of R3 on red LEDs
    B L1 // unconditional branch to L1
