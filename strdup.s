global ft_strdup
extern ft_strlen
extern ft_strcpy
extern malloc
section .text

;malloc sets errno if it fails, not my job here

ft_strdup:
    push rdi
    call ft_strlen
    inc rax
    mov rdi, rax
    call malloc wrt ..plt
    test rax, rax
    pop rsi 
    jz .error

    mov rdi, rax
    sub rsp, 8
    call ft_strcpy
    add rsp, 8
    ret
    .error:
        ret

section .note.GNU-stack noalloc noexec nowrite progbits