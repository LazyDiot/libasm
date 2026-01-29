global ft_strcmp
section .text

ft_strcmp:
    .loop:
        cmpsb
        jne .ne
        cmp byte [rsi - 1], 0
        jnz .loop
        xor rax, rax
        ret
    .ne:
        movzx rax, byte [rsi - 1]
        movzx rbx, byte [rdi - 1]
        sub rax, rbx
        ret