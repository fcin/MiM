Buffer DATA 10h
J DATA 20h
K DATA 21h
N DATA 22h
CSEG AT 0
	JMP start
CSEG AT 100h
start:
	CALL init
	CALL run

run:
	CALL random
	JMP run

random:	
	MOV A, N	; Ustaw N w zakresie 0-9
	MOV B, #10d
	DIV AB
	MOV N, B

	MOV A, J	; Ustaw J w zakresie 0-9
	ADD A, N
	MOV B, #10d
	DIV AB
	MOV J, B
	
	MOV A, K	; Ustaw K w zakresie 0-9
	ADD A, N
	MOV B, #10d
	DIV AB
	MOV K, B
	
	MOV A, #Buffer	; Wez wartosc Buffer + offset
	ADD A, J
	MOV R0, A
	
	MOV A, #Buffer	; Wez wartosc Buffer + offset
	ADD A, K
	MOV R1, A

	MOV A, @R0	; Buffer + J
	ADD A, @R1	; A + (Buffer + K)
	MOV B, #4d
	DIV AB		; Ustaw nowa liczbe w zakresie 0-3
	
	MOV A, #Buffer
	ADD A, N
	MOV R1, A
	MOV @R1, B
	
	MOV A, B	; Ustaw nowa wartosc w pozycji Buffer(n)
	
	INC J
	INC K
	INC N
	RET
 
init:
	MOV J, #6d
	MOV K, #9d
	MOV Buffer + 0, #4d
	MOV Buffer + 1, #5d
	MOV Buffer + 2, #3d
	MOV Buffer + 3, #3d
	MOV Buffer + 4, #3d
	MOV Buffer + 5, #4d
	MOV Buffer + 6, #6d
	MOV Buffer + 7, #2d
	MOV Buffer + 8, #6d
	MOV Buffer + 9, #5d
	RET
	
END