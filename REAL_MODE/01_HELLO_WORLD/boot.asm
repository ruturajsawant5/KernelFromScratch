ORG 0x7C00 ;afd
BITS 16 ;ahd 

;output character 'A' into terminal
;Int 10/AH=0Eh - VIDEO - TELETYPE OUTPUT
;AH = 0Eh
;AL = character to write
;BH = page number
;BL = foreground color (graphics modes only)
; start:
;     mov ah, 0eh ;0eh into ah
;     mov al, 'A'
;     mov bx, 0
;     int 0x10 ;calling the BIOS

;     ;keep jumping to itself
;     ;dont want to execute code that is boot signature
;     jmp $

start:
    mov si, message ;move address of message label into si
    call print
    jmp $

print:
    mov bx, 0
.loop:
    lodsb ;load character si poiting to into al and increment it
    cmp al, 0 ; check null termination
    je .done ; if 0 jump to done
    call print_char
    jmp .loop
.done:
    ret

print_char:
    mov ah, 0eh ;0eh into ah
    int 0x10 ;calling the BIOS
    ret

;0 is NULL terminator at end
message: db "Hello, World!!!", 0

;fill at least 510 bytes of data
;pad rest 0
;$ is current location of code
;$$ is start location of code
;db define byte
times 510- ($ - $$) db 0

;Intel is little endian so reverse of 55AA
;dw define word
dw 0xAA55