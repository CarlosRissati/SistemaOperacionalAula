# RissatiOS
Projeto referente a aula de Sistemas Operacionais. O objetivo do trabalho é seguir as aulas do canal FrancisBFTC sobre o KiddieOS codando na linguagem assembly.

# Guia Passo a Passo para Compilar e Executar um Sistema Operacional Utilizando NASM, FergoRaw e Oracle VirtualBox

Bem-vindo ao nosso guia detalhado para criar e executar seu próprio sistema operacional utilizando NASM, FergoRaw, Oracle VirtualBox e Rufus. Este processo pode parecer complicado à primeira vista, mas com este tutorial, você estará no caminho certo para criar seu próprio sistema operacional do zero. Vamos começar! 💻🚀

## Pré-requisitos

Antes de começarmos, verifique se você possui os seguintes softwares instalados em seu sistema:

- NASM (Assembler para Intel x86)
- FergoRaw (Ferramenta para criar imagens de disco)
- Oracle VirtualBox (Plataforma de virtualização)
- Rufus (Ferramenta para criar dispositivos de inicialização)

## Passo 1: Escrevendo o Código Assembly

Primeiro, escreva seu código assembly usando o NASM. Certifique-se de salvar seu código com a extensão `.asm`. Aqui está um exemplo simples:

```assembly
section .text
global _start

_start:
    mov ah, 0x0e
    mov al, 'H'
    int 0x10

    mov al, 'e'
    int 0x10

    mov al, 'l'
    int 0x10

    mov al, 'l'
    int 0x10

    mov al, 'o'
    int 0x10

    int 0x20
```

## Passo 2: Compilando o Código Assembly

Agora, compile seu código assembly usando o NASM:

```
nasm -f bin -o boot.bin boot.asm
```

Isso irá gerar um arquivo `boot.bin`.

## Passo 3: Criando uma Imagem de Disco

Use o FergoRaw para criar uma imagem de disco:

```
fergo-raw create --f=hd --s=20M --t=win --o=myos.img
```

Isso criará uma imagem de disco chamada `myos.img` com 20MB de tamanho.

## Passo 4: Escrevendo o Binário na Imagem de Disco

Escreva o arquivo binário gerado pelo NASM na imagem de disco:

```
fergo-raw write --i=myos.img --f=boot.bin --a=0x0
```

Isso irá escrever o arquivo `boot.bin` na imagem de disco `myos.img`.

## Passo 5: Criando um Dispositivo de Inicialização

Agora, use o Rufus para criar um dispositivo de inicialização a partir da imagem de disco:

1. Abra o Rufus e selecione o dispositivo USB.
2. Selecione a opção "Image ISO" e escolha a imagem de disco `myos.img`.
3. Clique em "Start" para criar o dispositivo de inicialização.

## Passo 6: Bootando o Sistema Operacional na Máquina Virtual

Finalmente, abra o Oracle VirtualBox e crie uma nova máquina virtual:

1. Clique em "New" e siga o assistente para criar uma nova máquina virtual.
2. Na configuração da máquina virtual, selecione a imagem de disco `myos.img` como disco de inicialização.
3. Inicie a máquina virtual.

E voilà! Seu sistema operacional personalizado deve agora ser iniciado na máquina virtual! 🎉✨

Espero que este guia detalhado tenha sido útil para você criar seu próprio sistema operacional do zero. Se tiver alguma dúvida, não hesite em nos perguntar. Happy coding! 😊👨‍💻
