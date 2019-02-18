.include "m8515def.inc" 
.def temp = r16 
.def reg_led = r20 
.equ START = 0
.equ STOP = 1 
.org $000
	rjmp init

INIT: 	ldi reg_led,0x00 
	  	sec 
		ser temp 
		out DDRC,temp 
		out PORTB,temp
		clr temp 
		out DDRD,temp 
		ldi temp,0x03 
		out PORTD,temp 

WAITSTART: 
		sbic PIND,START 
		rjmp WAITSTART 

LOOP: 	out PORTC,reg_led 
		ldi r17,1
d1:		ldi r18,1
d2:		ldi r19,1
d3:		dec r19
		brne d3
		dec r18
		brne d2
		dec r17
		brne d1

		sbic PIND,STOP 
		rjmp MM 
		rjmp WAITSTART 
MM:		brts LEFT 
		sbrs reg_led,0 


		
		inc reg_led
		lsl reg_led
		rjmp LOOP 

LEFT:	sbrs reg_led,7 
		clt 
		lsr reg_led
		rjmp LOOP
