global ft_strdup
section .text

;malloc sets errno if it fails, not my job here

ft_strdup:
    mov rsi, rdi
    call ft_strlen
    inc rax
    mov rdi, rax
    call malloc
    test rax, rax
    jz .error
    mov rdi, rax
    call ft_strcpy
    ret
    .error:
        xor rax, rax
        ret