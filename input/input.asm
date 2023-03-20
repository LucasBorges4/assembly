
segment .data
         LF equ 0xA ; line feed, quebra de linha
         NULL equ 0xD;
         SYS_CALL equ 0x80 ; envia informação ao SO
    ; -----------------------------------------------
    ; EAX
         SYS_EXIT equ 0x1; Codigo de chamada finalizador
         SYS_WRITE equ 0x4; operação de escrita
         SYS_READ equ 0x3; operação de leitura
    ; EBX 
         RETURN_EXIT equ 0x0; Operação de sucesso, pode ser com qualquer valor.
         STD_IN equ 0x0; Entrada Padrão [em EBX]
         STD_OUT equ 0x1; Saída Padrão [em EBX]

section .data
         msg db "Entre com seu nome:", LF, NULL
         tam equ $- msg

section .bss
    nome resb 1

section .text

global _start
    ;label

_start:
         mov EAX, SYS_WRITE
         mov EBX, STD_OUT
         mov ECX, msg
         mov EDX, tam
         int SYS_CALL 

         mov EAX, SYS_READ
         mov EBX, STD_IN
         mov ECX, nome
         mov EDX, 0xA
         int SYS_CALL

         mov EAX, SYS_EXIT
         mov EBX, RETURN_EXIT
         int SYS_CALL