;repe = repeat while equal

global ft_strcmp
section .text

ft_strcmp :
    .loop:
        mov al, [rsi]
        mov bl, [rdi]
        cmp al, bl
        jne .ne
        cmp al, 0 ;could be test al, al apparently?
        jz .equ
        inc rsi
        inc rdi
        jmp .loop
    .ne:
        movzx rax, al
        movzx rbx, bl
        sub rax, rbx
        ret
    .equ:
        xor rax, rax
        ret

section .note.GNU-stack noalloc noexec nowrite progbits