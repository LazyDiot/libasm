global ft_read
extern __errno_location
section .text

ft_read:
    mov rax, 0
    syscall
    cmp rax, 0
    jl .error
    ret
    .error:
        neg rax ; because using imul rax, rax, -1 will get me flamed and shamed
        mov rdi, rax
        call __errno_location
        mov [rax], rdi
        mov rax, -1
        ret