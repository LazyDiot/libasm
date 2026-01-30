global ft_strdup
extern ft_strlen
extern ft_strcpy
extern malloc
section .text

;malloc sets errno if it fails, not my job here

ft_strdup:
    push rdi ;rsi clobbered yet again....
    call ft_strlen
    inc rax
    mov rdi, rax
    call malloc wrt ..plt ;With Respect To the Procedure Linkage Table (replaces -no-pie flag)
    test rax, rax
    pop rsi ;restores original pointer
    jz .error
    mov rdi, rax
    call ft_strcpy
    ret
    .error:
        xor rax, rax
        ret

section .note.GNU-stack noalloc noexec nowrite progbits