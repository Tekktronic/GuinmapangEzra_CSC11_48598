.text
.global main
main: 				@ start:
	MOV R0, #0		@ tempSF/display
	MOV R1, #0		@ loop counter = 0
	MOV R2, #127		@ dividend = 111
	MOV R3, #5		@ divisor = 5
	MOV R4, #0		@ multiplier = 10
	MOV R5, #0		@ currentSC = 1
	MOV R6, #10		@ currentSF = 0
	MOV R7, #0		@ nextSF = 0
	MOV R8, #0		@ nextSC = 0
	MOV R9, #0		@ tempSC = 0
	BAL loop		@ branch to loop
getscale:
	MUL R5, R6, R8
	MOV R9, R8
scalediv:
	MOV R0, R7
	MUL R7, R4, R5		@ nextSF = currentSF * currentSC
	MOV R8, R5
	CMP R7, R2
	BLE getscale
loop:
	MOV R4, R3
	MOV R5, #1
	CMP R7, R2		@ test if divisor < dividend
	BLE scalediv		@ branch to reset if true
	SUB R2, R2, R0		@ perform the subtraction
	CMP R2, R3		@ test if dividend < divisor
	ADD R1, R1, R9		@ add currentSC to loop counter
	MOV R7, #0
	BLT showquotient
	BGE loop		@ branch to loop if false
showquotient:
	MOV R0, R1		@ move quotient to display
exit:
	MOV R7, #1		@ move 1 into R7 - syscall #
	BX LR			@ SWI 0			@ exit through syscall
