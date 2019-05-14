Stala EQU 1000
DanaL DATA 20h
DanaH DATA 21h
WynikL DATA 30h
WynikH DATA 31h
CSEG AT 0
JMP start
CSEG AT 100h
 start:
 MOV DanaL, #255
 MOV DanaH, #255
 MOV A,DanaL
 SUBB A,#low(Stala)
 MOV WynikL,A
 MOV A,DanaH
 SUBB A,#high(Stala)
 MOV WynikH,A
END 