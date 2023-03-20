
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
         x dd 50 ; db = define byte (1 bye), dw == define word (1 char, 2 bytes)
         y dd 10; dd = define double word (4 bytes), dq == define quad word (4b)
         ; dt define ten word (10 bytes)
         msg1 db "X maior que Y", LF, NULL
         tam1 equ $ - msg1
         msg2 db "Y maior que X", LF, NULL
         tam2 equ $ - msg2

section .bss

global _start

_start:
         mov EAX, DWORD[x]
         mov EBX, DWORD[y]

         ; if (comparação)

         cmp EAX, EBX
         ; salto condicional

         jge maior
         jl menor 
         ; je = , jg >, jge >=, jl <, jle <=, jne !=

         ; salto incondicional jmp (go to)


