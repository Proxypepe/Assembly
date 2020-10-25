%include "io64.inc"

section '.arip_input'
; | input
;  rax, rbx, rcx
; | output
; rax

arip_input:
    push rbx
    push rcx
    push rdx
    
    xor rax, rax
    xor rbx, rbx
    xor rcx, rcx    
    xor rdx, rdx
    GET_UDEC 1, rax
    GET_UDEC 1, rbx
    GET_UDEC 1, rcx
 
    div rbx
    add rax, rcx  
    
    pop rdx
    pop rcx
    pop rbx
    ret 

section '.arip'
; | input
;  rax, rbx, rcx
; | output
; rax
arip:
    push rdx
    xor rdx, rdx
    div rbx
    add rax, rcx  
    pop rdx
    ret 

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging    
    xor rax, rax
    xor rbx, rbx
    xor rcx, rcx

    mov rax, 4
    mov rbx, 5
    mov rcx, 5
    mov rdx, 13
    ;call arip 
    call arip_input
    
    PRINT_UDEC 1, rax
    PRINT_UDEC 1, rbx
    PRINT_UDEC 1, rcx
    PRINT_UDEC 1, rdx
    
    ret
