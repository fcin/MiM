CSEG AT 0
JMP init

ORG 000Bh
	LJMP lab1

CSEG AT 100h

init:
	MOV IE, #85h
	SETB IE.1
	MOV TMOD,#01 ; 16-bitowy timer 0
	SETB TR0 ; startujemy timer 0
	SJMP start

start:
	MOV TH0,#165
	MOV TL0,#255
	SJMP idle

idle:
	SJMP idle
	
lab1:
	INC A
	CLR TF0
	CJNE A, #39, endit
	INC B
	MOV P2, B
	MOV A, #0
	RETI
	
endit:
	MOV TH0,#165
	MOV TL0,#255
	RETI
		
		
END 