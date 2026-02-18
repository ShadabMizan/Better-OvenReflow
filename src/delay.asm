; Wait 10 millisecond using Timer 0
Wait10ms:
	clr	TR0
	mov	a,#0xF0
	anl	a,TMOD
	orl	a,#0x01
	mov	TMOD,a
	mov	TH0, #high(TIMER_10ms)
	mov	TL0, #low(TIMER_10ms)
	clr	TF0
	setb TR0
	jnb	TF0,$
	clr	TR0
	ret
	
; Wait R2 10-milliseconds
MyDelay:
	lcall Wait10ms
    djnz R2, MyDelay
	ret
