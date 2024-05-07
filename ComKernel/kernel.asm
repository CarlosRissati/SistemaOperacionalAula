[BITS 16]
[ORG 0000h]

jmp OSMain

; Includes

%INCLUDE "Hardware/wmemory.lib"
%INCLUDE "Hardware/Monitor.lib"
%INCLUDE "Hardware/disk.lib"

; Iniciando o sistema

OSMain:
    call ConfigSegment
    call ConfigStack
    call VGA.SetVideoMode
    call DrawBackground
    call EffectInit
    call GraficInterface
    jmp END
; ---------------------------------
; Funções do Kernel
GraficInterface:
    mov byte[Window_Bar], 1
    mov word[Window_PositionX], 5
    mov word[Window_PositionY], 5
    mov word[Window_Width], 100
    mov word[Window_Height], 100
    mov byte[Window_Border_Color], 21
    mov byte[Window_Bar_Color], 16
    mov byte[Window_Back_Color], 55
    mov byte[ButtonClose], 1
    mov byte[ButtonMaximize], 1
    mov byte[ButtonMinimize], 1
    mov byte[Sector], 5
    mov byte[Drive], 80h ;primeiro disco de boot, 81 é o segundo disco
    mov byte[NumSectors], 2
    mov word[SegmentAddr], 0800h
    mov word[OffsetAddr], 0500h
    call ReadDisk
    call WindowAddress
    mov byte[Window_Bar], 0
    mov word[Window_PositionX], 20
    mov word[Window_PositionY], 20
    mov word[Window_Width], 65
    mov word[Window_Height], 65
    mov byte[Window_Border_Color], 21
    mov byte[Window_Back_Color], 55
    mov byte[Window_Border], 1
    mov byte[Window_Border_Right], 29
    mov byte[Window_Border_Down], 29
    mov byte[Window_Border_Left], 0
    mov byte[Window_Border_Up], 0
    call WindowAddress
ret

ConfigSegment:
    mov ax, es
    mov ds, ax
ret

ConfigStack:
    mov ax, 7D00h
    mov ss, ax ; 7DOOh:03FEh
    mov sp, 03FEh
ret

END:
    mov ah, 00h
    int 16h
    ; reiniciar o computador
    mov ax, 0040h
    mov ds, ax
    mov ax, 1234h
    mov [0072h], ax
    jmp 0FFFFh:0000h
; ---------------------------------