mov ah, 0x0e ; switch to teletype (TTY) mode
mov al, 65 ; what char u want to print
int 0x10 ; bios interrupt
loop: 
    inc al
    cmp al, 'Z' + 1 ; compare al to 'Z' + 1
    je exit ; if compare is true jump to exit
    int 0x10 ; bios interrupt
    jmp loop ; jump to label
exit:
    jmp $ ; jump to current
times 510-($-$$) db 0 ; times instruction is like a loop kinda
db 0x55, 0xaa ; db is deploy byte i think