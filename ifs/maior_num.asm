
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
    x dd 50 
    y dd 10
    msg1 db "X maior que Y", LF, NULL
    tam1 equ $- msg1

    msg2 db "Y maior que X", LF, NULL
    tam2 equ $- msg2


section .bss
    nome resb 1

section .text

global _start
    ;label

_start:
    mov EAX, DWORD[x];
    mov EBX, DWORD[y];

    ; if - comparacao

    cmp EAX, EBX ; defina ordem de comparação;
    jge maior ; tipo maior;

    mov ECX, msg2
    mov EDX, tam2

    jmp final

    ; je =; jg >; jge >=; jl <; jle <=; jle <=; jne !=;

    ;Salto incondicional jmp
    
maior:
    mov ECX, msg1
    mov EDX, tam1

final:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    int SYS_CALL

    mov EAX, SYS_EXIT
    mov EBX, RETURN_EXIT ; xor EBX, EBX (SEMPRE VAI DAR 0 POR CONTA DA LOGICA DOS BITS)
    int SYS_CALL
