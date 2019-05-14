CSEG AT 0
JMP start

ORG 0003h
	LJMP lab1
	
ORG 0023h
	LJMP lab1
	
ORG 0013h
	LJMP lab1

CSEG AT 100h
 start:
	SETB IE.0
	SETB IE.5
	SETB IE.7
	;MOV IE, #85h
	;MOV TH0,#76
	;MOV TL0,#01
	MOV U1, #5
	MOV TMOD,#01 ; 16-bitowy timer 0
	SETB TR0 ; startujemy timer 0
	JNB TF0,$ ;Jezeli TF0 nie jest ustawione to nie ma przepelnie 
		
	lab1:
	;TODO:
	;WYSLIJ DO WYSWIETLACZA
	;PO CO DRUGI TIMER?
		MOV TH0,#0h
		MOV TL0,#0h
		MOV A, #5
		RETI
END 