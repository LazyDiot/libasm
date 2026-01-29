global ft_strcpy
section .text

ft_strcpy:
    xor rdx, rdx
    .loop:
        cmp byte [rsi + rdx], 0
        je .done
        mov al, [rsi + rdx]
        mov [rdi + rdx], al
        inc rdx
        jmp .loop
    .done:
        mov [rdi + rdx], 0
        mov rax, rdi    ; equivalent a lea rax, [rdi] mais en plus rapide
        ret

; pas de check de NULL car libc attend des valid strings