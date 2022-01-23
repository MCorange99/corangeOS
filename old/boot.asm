[org 0x7c00]
mov ah, 0x0e ; switch to teletype (TTY) mode
mov bx, variableName

printString:
    mov al, [bx]
    cmp al, 0
    je exit
    int 0x10
    inc bx
    jmp printString

exit:
    jmp $ ; jump to current address
variableName:
    db "Hello world but easy!", 0

times 510-($-$$) db 0 ; times instruction is like a loop kinda
db 0x55, 0xaa ; db is deploy byte i think