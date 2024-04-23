[BITS 16]
[ORG 0000h]

jmp OSMain

BackWidth db 0
BackHeight db 0
Pagination db 0
Welcome db "Bem-vindo ao RissatiOS!",0


OSMain:
    call ConfigSegment
    call ConfigStack
    call TEXT.SetVideoMode
    jmp ShowString

ShowString:
    mov dh, 3
    mov dl, 2
    call MoveCursor
    mov si, Welcome
    call PrintString
    jmp END

ConfigSegment:
    mov ax, es
    mov ds, ax
ret

ConfigStack:
    mov ax, 7D00h
    mov ss, ax ; 7DOOh:03FEh
    mov sp, 03FEh
ret

TEXT.SetVideoMode:
    mov ah, 00h
    mov al, 03h
    int 10h
    mov BYTE[BackWidth], 80
    mov BYTE[BackHeight], 20
ret

PrintString:
    mov ah, 09h
    mov bh, [Pagination]
    mov bl, 40
    
    mov cx, 1
    mov al, [si]
    print:
        int 10h
        inc si
        call MoveCursor
        mov ah, 09h
        mov al, [si]
        cmp al, 0
        jne print
ret

MoveCursor:
    mov ah, 02h
    mov bh, [Pagination]
    inc dl
    int 10h
ret

END:
    jmp $