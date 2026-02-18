$MODMAX10

org 0000h
    ljmp main

CSEG

$include(defines.inc)
$include(uart.asm)
$include(delay.asm)

InitialString: db '\r\nHello, World!\r\n', 0

main:
    mov sp, #0x7f
    lcall Initialize_LEDs
    lcall Initialize_Serial_Port

forever:
    mov dptr, #InitialString
    lcall SendString
    
    mov R2, #50
	lcall MyDelay ; wait 0.5 seconds
	cpl LEDRA.0
	sjmp forever

Initialize_LEDs:
    ; Turn off LEDs
	mov	LEDRA,#0x00
	mov	LEDRB,#0x00
	ret

end