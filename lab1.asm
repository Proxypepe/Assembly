%include "io64.inc"

section .data
array dd 1, 2, 7, 4, 5, 4
len dd 6

section .text
global CMAIN
CMAIN:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
.loop1:
    mov eax, [array + 4 * ecx]
    cmp eax, edx
    jg .max
.subloop:
    inc ecx
    cmp ecx, [len]
    jl .loop1   
    jmp .exit
.max:
    mov edx, eax
    jmp .subloop
    
.exit:
    PRINT_UDEC 1, edx
    int 0x80
    
