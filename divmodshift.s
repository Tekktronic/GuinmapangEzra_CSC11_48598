.data
.balign 4
prompt1:			@ first prompt message
	.asciz "Please enter the dividend: "
.balign 4
prompt2:			@ second prompt message
	.asciz "Please enter the divisor: "
.balign 4
input_pattern:			@ scan pattern for scanf
	.asciz "%d"
.balign 4
input:				@ user input is stored here
	.word 0
.balign 4
return:				@ return to appropriate instruction
	.word 0
.balign 4
return2:			@ return to appropriate instruction
	.word 0
.text
.global main
main:
@ initialize everything
	mov r0, #0
	mov r1, #0
	mov r2, #0
	mov r3, #0
	ldr r1, p_return	@ load address of return to r1
	str lr, [r1]		@ store the address into the link register
	ldr r0, p_prompt1	@ load address of prompt1 into r0
	bl printf		@ execute printf for prompt1
p_prompt1:			@ pointer to prompt1
	.word prompt1
p_prompt2:			@ pointer to prompt2
	.word prompt2
p_input_pattern:		@ pointer to input pattern
	.word input_pattern
p_input:			@ pointer to input
	.word input
p_return:			@ pointer to return
	.word return
p_return2:			@ pointer to return
	.word return2
@ externally defined functions
.global printf
.global scanf
