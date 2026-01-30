;repe = repeat while equal

global ft_strcmp
section .text

ft_strcmp :
    .loop:
        mov al, [rdi]
        mov cl, [rsi]
        cmp al, cl
        jne .ne
        cmp al, 0 ;could be test al, al apparently?
        jz .equ
        inc rsi
        inc rdi
        jmp .loop
    .ne:
        movzx rax, al
        movzx rcx, cl
        sub rax, rcx
        ret
    .equ:
        xor rax, rax
        ret

section .note.GNU-stack noalloc noexec nowrite progbits