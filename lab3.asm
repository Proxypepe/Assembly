%include "io64.inc"

section .data
len equ 2

data_for_add dd 0eh, 3
data_for_sub dd 1, 0ffh

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
xor rcx, rcx
.of_flag:
    xor al, al
    mov al, 72h
    add al, [data_for_add + 4 * rcx]
    jo .overflow
    PRINT_STRING "Not overflowed"
    NEWLINE
    jmp .cmp_of
.overflow:
    PRINT_STRING "Overflowed"
    NEWLINE
    jmp .cmp_of
    
.cmp_of:
    inc rcx
    cmp rcx, len
    jl .of_flag    
    jmp .end
.end:
xor rcx, rcx    

.carry_flag:
    xor al, al
    mov al, 3
    sub al, [data_for_sub + 4 * rcx]
    jc .carry
    PRINT_STRING "Not carried"
    NEWLINE
    jmp .cmp_cf
.carry:
    PRINT_STRING "Carried"
    NEWLINE
    jmp .cmp_cf
    
.cmp_cf:
    inc rcx
    cmp rcx, len
    jl .carry_flag    
    jmp .exit

.exit:

    ret
