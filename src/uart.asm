Initialize_Serial_Port:
	; Configure serial port and baud rate
	clr TR1 ; Disable timer 1
	anl TMOD, #0x0f ; Mask the bits for timer 1
	orl TMOD, #0x20 ; Set timer 1 in 8-bit auto reload mode
    orl PCON, #80H ; Set SMOD to 1
	mov TH1, #low(TIMER_1_RELOAD)
	mov TL1, #low(TIMER_1_RELOAD) 
	setb TR1 ; Enable timer 1
	mov SCON, #52H
	ret

putchar:
	jbc	TI,putchar_L1
	sjmp putchar
putchar_L1:
	mov	SBUF,a
	ret

SendString:
    clr a
    movc a, @a+dptr
    jz SendString_L1
    lcall putchar
    inc dptr
    sjmp SendString  
SendString_L1:
	ret



