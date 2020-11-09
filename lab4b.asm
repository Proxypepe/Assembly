%include "io64.inc"

section '.arip'
; | input
;  rax, rbx, rcx, rdx
; | output
; ax (eax)
arip:
    cmp rdx, 2
    je .two_bytes
    push rdx
    xor edx, edx
    div ebx
    add eax, ecx  
    pop rdx
    ret
.two_bytes:
    push dx
    xor dx, dx
    div bx
    add ax, cx
    pop dx
    ret
    
section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging    
    xor rax, rax
    xor rbx, rbx
    xor rcx, rcx

    mov rax, 8
    mov rbx, 2
    mov rcx, 256
    mov rdx, 2

    call arip_r

    
    ret
    
    
