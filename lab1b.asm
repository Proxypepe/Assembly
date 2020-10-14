%include "io64.inc"

section .data
len dd 6

section .bss 
array resd 4

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
.loop1:
    GET_UDEC 4, [array + 4 * ecx]
    PRINT_UDEC 4, [array + 4 * ecx]
    inc ecx
    cmp ecx, [len]
    jl .loop1
    xor ecx, ecx
    
.loop_i:
    .loop_j:
        mov eax, [array + 4 * edx]
        mov ebx, [array + 4 * edx + 4]
        cmp eax, ebx
        jge .swap
        .count:
        inc edx
        cmp edx, [len]
        jl .loop_j
    xor edx, edx
    inc ecx
    cmp ecx, [len]
    jl .loop_i
    
    jmp .exit
    
.swap:
    mov [array + 4 * edx], ebx
    mov [array + 4 * edx + 4], eax
    xor eax, eax
    xor ebx, ebx
    jmp .count
.exit:
NEWLINE
xor ecx, ecx
inc ecx
.loop3:
    PRINT_UDEC 4, [array + 4 * ecx]
    inc ecx
    cmp ecx, [len]
    jle .loop3
int 0x80
