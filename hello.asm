; Compilar - Transformar o programa para linguagem de maquina
; para instalar o nasm no windows basta usar o comando via powershell : winget install nasm -i
; nasm -f elf64 assembly.asm
; ld -s -o assembly assembly.o
; .data é constantes

section .data 
    msg db 'Hello World!', 0x0A
    tam equ $- msg

section .text

global _start

_start:
    mov EAX, 0x4 ; quero fazer uma saida
    mov EBX, 0x1 ; na saida padrao
    mov ECX, msg ; mostra a mensagem
    mov EDX, tam ; tamanho é esse
    int 0x80 ; "CAMBIO", executa.
output:
    mov EAX, 0x1 ; terminando o programa
    mov EBX, 0x0 ; valor de retorno é 0
    int 0x80