[BITS 16]
[ORG 0x7C00]

; Coloca e printa de uma em uma Character no registrador AL
call HelloWorld
call JumpLine

; Lê uma String
call JumpLine
call PointerString
call PrintString

; Lê do buffer oque o usuario digita
call PointerBuffer
call ReadString
call PointerStringBuf
call PrintString
call Teste
call Teste

jmp $

Teste:
    mov ah, 0eh
    mov al, 0ah
    int 10h
    mov al, 0dh
    int 10h
    mov al, 43h
    int 10h
    ret

HelloWorld:
    mov ah, 0eh
    mov al, 48h ; 48h -> 'H'
    int 10h
    mov al, 65h ; 65h -> 'e'
    int 10h
    mov al, 6ch ; 6ch -> 'l'
    int 10h
    mov al, 6ch ; 6ch -> 'l'
    int 10h
    mov al, 6fh ; 6fh -> 'o'
    int 10h
    mov al, 20h ; 20h -> ' '
    int 10h
    mov al, 57h ; 57h -> 'W'
    int 10h
    mov al, 6fh ; 6fh -> 'o'
    int 10h
    mov al, 72h ; 72h -> 'r'
    int 10h
    mov al, 6ch ; 6ch -> 'l'
    int 10h
    mov al, 64h ; 64h -> 'd'
    int 10h
    ret

JumpLine:
    mov ah, 0eh
    mov al, 0ah
    int 10h
    mov al, 0dh
    int 10h
    ret

PointerString:
    mov si, hello
    ret

PointerBuffer:
    mov di, buffer
    ret

PointerStringBuf:
    mov si, buffer
    ret

PrintString:
    mov ah, 0eh
    mov al, [si]
    print:
        int 10h
        inc si
        mov al, [si]
        cmp al, 00h   
        jne print
        jp Teste
    ret

ReadString:
    mov ah, 00h
    int 16h
    mov ah, 0eh
    int 10h
    mov [di], al
    inc di
    cmp al, 0dh
    jne ReadString
    mov ah, 0eh
    mov al, 0ah
    int 10h
ret

hello db "Hello World!",13,10,0
buffer times 20 db 0

times 510 - ($-$$) db 0
dw 0xAA55