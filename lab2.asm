%include "io64.inc"

section .data
array dd 1, 2, 3, 4, 5, 6
len dd 6

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
.loop1:
    add eax, [array + 4 * ecx]
    inc ecx
    cmp ecx, [len]
    jl .loop1
    PRINT_UDEC 1, eax
    mov ebx, [len]
    div ebx
    NEWLINE
    PRINT_UDEC 1, eax
    
    int 0x80
