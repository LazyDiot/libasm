global ft_strcmp
section .text

ft_strcmp:
    .loop:
        cmpsb  ; Compare [rsi] with [rdi], increment both
        jne .ne
        cmp byte [rsi - 1], 0
        jnz .loop
        xor rax, rax
        ret
    .ne:
        movzx rax, byte [rsi - 1]
        movzx rcx, byte [rdi - 1]
        sub rax, rcx
        ret

section .note.GNU-stack noalloc noexec nowrite progbits