ECHO OFF
cls
echo Montando o arquivo bootloader...
nasm.exe -f bin bootloader.asm -o Binary/bootloader.bin
echo Montando o arquivo kernel...
nasm.exe -f bin kernel.asm -o Binary/kernel.bin
pause